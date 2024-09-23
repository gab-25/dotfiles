#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep python3 python3-pip nodejs npm

#install anaconda
python install_anaconda3.py

#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#copy dotfiles
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp -r ./zed/*.json $HOME/config/zed
