#!/bin/bash

#copy nvim configurations
cp -r ./nvim $HOME/.config

#copy dotfiles
cp ./bashrc $HOME/.bashrc
cp ./vimrc $HOME/.vimrc
cp ./gitconfig $HOME/.gitconfig

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
