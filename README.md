# dotfiles

My personal dotfiles

## requirements

Install requirements packages

```bash
sudo apt install -y curl vim fzf fd-find ripgrep gcc
```

Install tmux

```bash
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
rm -rf get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
```

Install google cloud cli

```bash
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz -C ~/
rm -rf google-cloud-cli-linux-x86_64.tar.gz
~/google-cloud-sdk/install.sh
```

Install firebase cli

```bash
curl -sL https://firebase.tools | bash
```

Install node.js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts
```
