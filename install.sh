#!/bin/bash

#copy nvim configurations
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
# cp -r ./nvim $HOME/.config

#copy dotfiles
cp ./bashrc $HOME/.bashrc
cp ./vimrc $HOME/.vimrc
cp ./gitconfig $HOME/.gitconfig

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
