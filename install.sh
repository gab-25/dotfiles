#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep python3 python3-pip nodejs npm

#install anaconda
python install_anaconda3.py

#copy dotfiles
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp -r ./zed/*.json $HOME/config/zed
