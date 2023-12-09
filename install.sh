#!/bin/bash

#copy nvim configuration
cp -r ./nvim $HOME/.config

#copy dotfiles
cp ./zshrc $HOME/.zshrc
cp ./gitconfig $HOME/.gitconfig
