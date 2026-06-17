#!/usr/bin/env bash
set -euo pipefail

info() { echo "[INFO] $*"; }
success() { echo "[OK]   $*"; }
skip() { echo "[SKIP] $*"; }

# --- Packages ---
info "Installing pacman packages..."
sudo pacman -Syu --noconfirm \
  bash-completion \
  btop \
  eza \
  fastfetch \
  fd \
  flatpak \
  fzf \
  gedit \
  github-cli \
  gnome-keyring \
  helm \
  k9s \
  kubectl \
  lazydocker \
  lazygit \
  neovim \
  net-tools \
  noto-fonts-emoji \
  rclone \
  restic \
  ripgrep \
  starship \
  ttf-jetbrains-mono-nerd \
  xclip \
  zed \
  zoxide
success "Pacman packages installed"

# --- Docker ---
if command -v docker &>/dev/null; then
  skip "docker already installed"
else
  info "Installing docker..."
  sudo pacman -S --noconfirm docker
  sudo usermod -aG docker "$USER"
  sudo systemctl enable --now docker
  success "docker installed and enabled (re-login or run 'newgrp docker' to apply group)"
fi

# --- Python (uv + poetry) ---
if command -v uv &>/dev/null; then
  skip "uv already installed"
else
  info "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  success "uv installed"
fi

if command -v poetry &>/dev/null; then
  skip "poetry already installed"
else
  info "Installing poetry..."
  curl -sSL https://install.python-poetry.org | python3 -
  success "poetry installed"
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
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
  success "nvm installed"
fi

# shellcheck source=/dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

if command -v node &>/dev/null; then
  skip "node already installed ($(node --version))"
else
  info "Installing Node.js LTS..."
  nvm install --lts
  success "Node.js LTS installed"
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

echo ""

success "All done! See the README to link the dotfiles, then restart your shell."
