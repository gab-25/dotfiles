#!/bin/bash
#TODO: trovare un modo per installare sempre le ultime versioni

sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep nodejs npm

#install anaconda
bash <(curl -s https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh)

#copy dotfiles
cp ./.bashrc $HOME/.bashrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
