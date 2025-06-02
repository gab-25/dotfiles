# dotfiles

My personal dotfiles

## requirements

Install requirements packages

```bash
sudo apt install -y vim fzf fd-find ripgrep gcc lazygit
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
