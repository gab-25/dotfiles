# dotfiles

My personal dotfiles

## requirements

Install requirements packages

```bash
sudo pacman -S --noconfirm fzf fd ripgrep lazygit lazydocker btop starship neovim rclone ttf-jetbrains-mono-nerd zed net-tools bash-completion
```

Install AUR Helper
```bash
sudo pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si)
rm -rf /tmp/yay
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
sudo pacman -S --noconfirm python-pipx
pipx install poetry
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

Install firebase cli

```bash
npm install -g firebase-tools
```

Install gemini cli

```bash
npm install -g @google/gemini-cli
```
