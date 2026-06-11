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
MAP=(
  "$HOME/.bashrc::.bashrc"
  "$HOME/.gitconfig::.gitconfig"
  "$HOME/.config/starship.toml::starship.toml"
  "$HOME/.config/kitty::kitty"
  "$HOME/.config/niri::niri"
)

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
    if diff -ruq "$dest" "$src" >/dev/null 2>&1; then
      skip "$src unchanged"
    else
      info "Changes for $src:"
      diff -ru "$dest" "$src" || true
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
  else
    cp "$src" "$dest"
  fi
  success "Saved $src -> ${dest#$DOTFILES/}"
done

if ! "$DIFF_ONLY"; then
  echo ""
  info "Done. Review with 'git diff' and commit the changes."
fi
