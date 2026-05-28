# dotfiles

My personal dotfiles

## requirements

Install requirements packages

```bash
sudo pacman -Sy --noconfirm net-tools bash-completion kubectl k9s helm restic btop starship fzf fd ripgrep lazygit lazydocker neovim zed rclone
```

Install AUR Helper

```bash
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si)
rm -rf /tmp/yay
```

Install ML4W

```bash
bash <(curl -s https://ml4w.com/os/stable)
```

Install docker

```bash
sudo pacman -S --noconfirm docker
sudo usermod -aG docker $USER
newgrp docker
```

Install python

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
curl -sSL https://install.python-poetry.org | python3 -
```

Install node.js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
source ~/.bashrc
nvm install --lts
```

Install google cloud cli

```bash
curl -o /tmp/google-cloud-cli-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf /tmp/google-cloud-cli-linux-x86_64.tar.gz -C ~/
rm -rf /tmp/google-cloud-cli-linux-x86_64.tar.gz
~/google-cloud-sdk/install.sh
```

Install antigravity cli

```bash
curl -fsSL https://antigravity.google/cli/install.sh | bash
```

Install claude code

```bash
curl -fsSL https://claude.ai/install.sh | bash
```
