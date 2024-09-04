#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl vim zsh fd-find ripgrep

#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#copy dotfiles
cp ./.zshrc $HOME/.zshrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
