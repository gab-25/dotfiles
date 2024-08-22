#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep nodejs npm

#install anaconda
bash <(curl -s https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh)

#install pycharm
curl -o /tmp/pycharm-community-2024.2.tar.gz https://download.jetbrains.com/python/pycharm-community-2024.2.tar.gz
tar -zxf /tmp/pycharm-community-2024.2.tar.gz -C $HOME/pycharm-community
rm /tmp/pycharm-community-2024.2.tar.gz

#install zed
curl -f https://zed.dev/install.sh | sh

#copy dotfiles
cp ./.bashrc $HOME/.bashrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp ./zed/* $HOME/.config/zed/
