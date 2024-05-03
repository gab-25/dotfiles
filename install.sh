#!/bin/bash

#copy nvim configurations
cp -r ./nvim $HOME/.config

#copy dotfiles
cp ./profile $HOME/.profile
cp ./vimrc $HOME/.vimrc
cp ./gitconfig $HOME/.gitconfig

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
