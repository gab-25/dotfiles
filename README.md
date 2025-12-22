# dotfiles

My personal dotfiles

## requirements

Install requirements packages

```bash
sudo apt install -y curl vim fzf fd-find ripgrep gcc lazygit btop starship
```

Install docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
rm -rf get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
```

Install python

```bash
curl -fsSL https://pyenv.run | bash
pyenv install 3.13
pip install pipx
pipx install poetry
```

Install node.js

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts
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
npm install -g firebase-tools
```

Install gemini cli

```bash
npm install -g @google/gemini-cli
```
