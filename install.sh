#!/bin/bash

#copy nvim configurations
cp -r ./nvim $HOME/.config

#copy dotfiles
cp ./vimrc $HOME/.vimrc
cp ./zshrc $HOME/.zshrc
cp ./gitconfig $HOME/.gitconfig

#copy bins
cp -r ./bin/* $HOME/.local/bin

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
