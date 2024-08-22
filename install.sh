#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep nodejs npm

#install anaconda
ANACONDA3_LATEST=$(python latest_anaconda3.py)
bash <(curl -s https://repo.anaconda.com/archive/$ANACONDA3_LATEST)

#copy dotfiles
cp ./.bashrc $HOME/.bashrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp ./zed/* $HOME/.config/zed/
