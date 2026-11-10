#!/usr/bin/env bash
set -euo pipefail

# Save the dotfiles currently in use into this repo, ready to commit.
# This is the reverse of the "copy dotfiles" step in the README:
# instead of repo -> $HOME, it copies $HOME -> repo.
#
# Usage:
#   ./save.sh         # copy the live dotfiles into the repo
#   ./save.sh --diff  # only show what changed, copy nothing

info() { echo "[INFO] $*"; }
success() { echo "[OK]   $*"; }
skip() { echo "[SKIP] $*"; }

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Mapping of "source in $HOME" -> "destination in the repo".
# Works for both single files and directories.
# Only configuration is saved, never app state (e.g. herdr-app's shared.json
# and layouts/.state/ are written by the app itself).
MAP=(
  "$HOME/.bashrc::.bashrc"
  "$HOME/.gitconfig::.gitconfig"
  "$HOME/.config/starship.toml::starship.toml"
  "$HOME/.config/herdr-app/settings.json::herdr-app/settings.json"
  "$HOME/.config/herdr-app/keys.json::herdr-app/keys.json"
  "$HOME/.config/herdr-app/themes::herdr-app/themes"
  "$HOME/.config/herdr-app/layouts::herdr-app/layouts"
)

# Names excluded when copying or diffing directories (app state, not config).
EXCLUDE=(".state")

DIFF_ONLY=false
[ "${1:-}" = "--diff" ] && DIFF_ONLY=true

for entry in "${MAP[@]}"; do
  src="${entry%%::*}"
  dest="$DOTFILES/${entry##*::}"

  if [ ! -e "$src" ]; then
    skip "$src does not exist"
    continue
  fi

  if "$DIFF_ONLY"; then
    diff_excl=()
    for x in "${EXCLUDE[@]}"; do diff_excl+=(-x "$x"); done
    if diff -ruq "${diff_excl[@]}" "$dest" "$src" >/dev/null 2>&1; then
      skip "$src unchanged"
    else
      info "Changes for $src:"
      diff -ru "${diff_excl[@]}" "$dest" "$src" || true
    fi
    continue
  fi

  mkdir -p "$(dirname "$dest")"
  if [ -d "$src" ]; then
    # Mirror the directory contents (delete files removed from the source),
    # skipping editor/backup junk we never want to commit.
    rm -rf "$dest"
    cp -r "$src" "$dest"
    find "$dest" -type f \( -name '*.bak' -o -name '*~' -o -name '*.backup' -o -name '*.backup.*' \) -delete
    for x in "${EXCLUDE[@]}"; do
      find "$dest" -name "$x" -prune -exec rm -rf {} +
    done
  else
    cp "$src" "$dest"
  fi
  success "Saved $src -> ${dest#$DOTFILES/}"
done

if ! "$DIFF_ONLY"; then
  echo ""
  info "Done. Review with 'git diff' and commit the changes."
fi
