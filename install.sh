#!/bin/bash
#TODO: trovare un modo per installare sempre le ultime versioni

sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep nodejs npm

#install neovim
curl -o /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar xzvf /tmp/nvim-linux64.tar.gz -C $HOME/nvim && rm /tmp/nvim-linux64.tar.gz
ln -s $HOME/nvim/bin/nvim -t $HOME/.local/bin

#install lazygit
culr -o /tmp/lazygit-linux64.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Linux_x86_64.tar.gz
tar xzvf /tmp/lazygit-linux64.tar.gz -C $HOME/.local/bin && rm /tmp/lazygit-linux64.tar.gz

#install anaconda
bash <(curl -s https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh)

#copy dotfiles
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp ./nvim $HOME/.config/
