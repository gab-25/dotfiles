#!/usr/bin/env bash
set -euo pipefail

# Update the packages installed by install.sh, via apt, homebrew and flatpak.
# Package managers that are not installed are skipped, so the same script
# works on machines where only some of them are set up.
#
# Usage:
#   ./update.sh               # update apt, homebrew and flatpak
#   ./update.sh --apt --brew  # only the package managers listed
#   ./update.sh --no-cleanup  # skip 'apt-get autoremove' and 'brew cleanup'

info() { echo "[INFO] $*"; }
success() { echo "[OK]   $*"; }
skip() { echo "[SKIP] $*"; }

usage() {
  cat <<'EOF'
Usage: ./update.sh [--apt] [--brew] [--flatpak] [--no-cleanup]

With no package manager flag, apt, homebrew and flatpak are all updated.
Package managers that are not installed are skipped.

  --apt         update apt packages
  --brew        update homebrew packages
  --flatpak     update flatpak apps
  --no-cleanup  skip 'apt-get autoremove' and 'brew cleanup'
  -h, --help    show this help
EOF
}

DO_APT=false
DO_BREW=false
DO_FLATPAK=false
CLEANUP=true

while [ $# -gt 0 ]; do
  case "$1" in
    --apt) DO_APT=true ;;
    --brew) DO_BREW=true ;;
    --flatpak) DO_FLATPAK=true ;;
    --no-cleanup) CLEANUP=false ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

# No package manager selected means "all of them".
if ! "$DO_APT" && ! "$DO_BREW" && ! "$DO_FLATPAK"; then
  DO_APT=true
  DO_BREW=true
  DO_FLATPAK=true
fi

# --- sudo ---
# apt and flatpak need root, homebrew does not. Ask for the password once,
# up front, and keep the sudo credentials alive for the whole run: an
# 'apt-get upgrade' that takes longer than sudo's timeout (15 minutes by
# default) would otherwise prompt again halfway through the script, when
# nobody is watching the terminal anymore.
SUDO_PID=""
release_sudo() {
  if [ -n "$SUDO_PID" ]; then
    # Kill the 'sleep' child too, otherwise it lingers after the script ends.
    pkill -P "$SUDO_PID" 2>/dev/null
    kill "$SUDO_PID" 2>/dev/null
    # Don't leave the sudo session we opened lying around.
    sudo -k 2>/dev/null
  fi
  return 0
}
trap release_sudo EXIT

if { "$DO_APT" && command -v apt-get &>/dev/null; } ||
  { "$DO_FLATPAK" && command -v flatpak &>/dev/null; }; then
  info "Asking for sudo access up front..."
  sudo -v
  # Refresh the credentials until this script exits.
  while kill -0 "$$" 2>/dev/null; do
    sudo -n true
    sleep 60
  done &
  SUDO_PID=$!
fi

# --- apt ---
if "$DO_APT"; then
  if command -v apt-get &>/dev/null; then
    info "Updating apt packages..."
    sudo apt-get update
    sudo apt-get upgrade -y
    if "$CLEANUP"; then
      info "Removing unused apt packages..."
      sudo apt-get autoremove -y
    fi
    success "apt packages updated"
  else
    skip "apt-get not installed"
  fi
fi

# --- Flatpak ---
if "$DO_FLATPAK"; then
  if command -v flatpak &>/dev/null; then
    info "Updating flatpak apps..."
    sudo flatpak update --system -y
    flatpak update --user -y
    if "$CLEANUP"; then
      info "Removing unused flatpak runtimes..."
      sudo flatpak uninstall --unused --system -y
      flatpak uninstall --unused --user -y
    fi
    success "flatpak apps updated"
  else
    skip "flatpak not installed"
  fi
fi

# --- Homebrew ---
# Homebrew runs 'sudo --reset-timestamp' on every invocation (see the "Reset
# sudo timestamp" block in Homebrew's brew.sh), which throws away the sudo
# credentials this script asked for. Keep it AFTER apt and flatpak, or their
# steps end up prompting for the password a second time.
if "$DO_BREW"; then
  BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
  if ! command -v brew &>/dev/null && [ -x "$BREW_BIN" ]; then
    eval "$("$BREW_BIN" shellenv)"
  fi

  if command -v brew &>/dev/null; then
    info "Updating homebrew packages..."
    brew update
    brew upgrade
    if "$CLEANUP"; then
      info "Cleaning up old homebrew versions..."
      brew cleanup
    fi
    success "homebrew packages updated"
  else
    skip "homebrew not installed"
  fi
fi

echo ""

success "All done!"
