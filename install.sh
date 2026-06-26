#!/usr/bin/env bash
set -euo pipefail

info() { echo "[INFO] $*"; }
success() { echo "[OK]   $*"; }
skip() { echo "[SKIP] $*"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMPDIR_DL="$(mktemp -d)"
trap 'rm -rf "$TMPDIR_DL"' EXIT

# --- Packages ---
info "Installing apt packages..."
sudo apt-get update
while read -r pkg; do
  # skip blank lines and comments
  [ -z "$pkg" ] && continue
  case "$pkg" in \#*) continue ;; esac

  if dpkg -s "$pkg" &>/dev/null; then
    skip "$pkg already installed"
  else
    info "Installing $pkg..."
    sudo apt-get install -y "$pkg"
    success "$pkg installed"
  fi
done <"$SCRIPT_DIR/apt-packages.txt"
success "apt packages installed"

# --- Homebrew ---
BREW_BIN="/home/linuxbrew/.linuxbrew/bin/brew"
if command -v brew &>/dev/null || [ -x "$BREW_BIN" ]; then
  skip "homebrew already installed"
else
  info "Installing homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  success "homebrew installed"
fi
[ -x "$BREW_BIN" ] && eval "$("$BREW_BIN" shellenv)"

# --- Homebrew packages ---
info "Installing homebrew packages..."
while read -r pkg; do
  # skip blank lines and comments
  [ -z "$pkg" ] && continue
  case "$pkg" in \#*) continue ;; esac

  if brew list "$pkg" &>/dev/null; then
    skip "$pkg already installed"
  else
    info "Installing $pkg..."
    brew install "$pkg"
    success "$pkg installed"
  fi
done <"$SCRIPT_DIR/brew-packages.txt"
success "homebrew packages installed"

# --- Docker ---
if command -v docker &>/dev/null; then
  skip "docker already installed"
else
  info "Installing docker..."
  curl -fsSL https://get.docker.com | sh
  sudo usermod -aG docker "$USER"
  sudo systemctl enable --now docker
  success "docker installed and enabled (re-login or run 'newgrp docker' to apply group)"
fi

# --- JetBrains Mono Nerd Font ---
if fc-list 2>/dev/null | grep -qi "JetBrainsMono Nerd Font"; then
  skip "JetBrains Mono Nerd Font already installed"
else
  info "Installing JetBrains Mono Nerd Font..."
  mkdir -p "$HOME/.local/share/fonts/JetBrainsMono"
  curl -fsSL -o "$TMPDIR_DL/JetBrainsMono.zip" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
  unzip -oq "$TMPDIR_DL/JetBrainsMono.zip" -d "$HOME/.local/share/fonts/JetBrainsMono"
  fc-cache -f >/dev/null
  success "JetBrains Mono Nerd Font installed"
fi

# --- Python (uv) ---
if command -v uv &>/dev/null; then
  skip "uv already installed"
else
  info "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  success "uv installed"
fi

# --- Rust (rustup) ---
if command -v rustup &>/dev/null; then
  skip "rustup already installed"
else
  info "Installing rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  success "rust installed"
fi

# --- Node.js (nvm) ---
if [ -d "$HOME/.nvm" ]; then
  skip "nvm already installed"
else
  info "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
  success "nvm installed"
fi

# shellcheck source=/dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

if command -v node &>/dev/null; then
  skip "node already installed ($(node --version))"
else
  info "Installing latest Node.js..."
  nvm install node
  success "latest Node.js installed"
fi

# --- zed ---
if command -v zed &>/dev/null; then
  skip "zed already installed"
else
  info "Installing zed..."
  curl -fsSL https://zed.dev/install.sh | sh
  success "zed installed"
fi

# --- Google Cloud CLI ---
if command -v gcloud &>/dev/null; then
  skip "gcloud already installed"
else
  info "Installing Google Cloud CLI..."
  curl https://sdk.cloud.google.com | bash
  success "gcloud installed (restart your shell to use it)"
fi

# --- Antigravity CLI ---
if command -v agy &>/dev/null; then
  skip "antigravity already installed"
else
  info "Installing Antigravity CLI..."
  curl -fsSL https://antigravity.google/cli/install.sh | bash
  success "Antigravity CLI installed"
fi

# --- Claude Code ---
if command -v claude &>/dev/null; then
  skip "claude already installed"
else
  info "Installing Claude Code..."
  curl -fsSL https://claude.ai/install.sh | bash
  success "Claude Code installed"
fi

# --- Open Code ---
if command -v opencode &>/dev/null; then
  skip "opencode already installed"
else
  info "Installing opencode..."
  curl -fsSL https://opencode.ai/install | bash
  success "opencode installed"
fi

echo ""

success "All done! See the README to link the dotfiles, then restart your shell."
