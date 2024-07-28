#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl zsh tmux vim fzf fd-find ripgrep nodejs npm cargo

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#install neovim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
cp -r ./nvim/. $HOME/.config/lvim

#copy dotfiles
cp ./zshrc $HOME/.zshrc
cp ./vimrc $HOME/.vimrc
cp ./gitconfig $HOME/.gitconfig
cp ./tmux.conf $HOME/.tmux.conf

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
