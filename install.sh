#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl zsh tmux vim fzf fd-find ripgrep nodejs npm cargo

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#install neovim
curl -o /tmp/nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar xzvf /tmp/nvim-linux64.tar.gz -C $HOME/nvim && rm /tmp/nvim-linux64.tar.gz
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
culr -o /tmp/lazygit-linux64.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.43.1/lazygit_0.43.1_Linux_x86_64.tar.gz
tar xzvf /tmp/lazygit-linux64.tar.gz -C $HOME/.local/bin && rm /tmp/lazygit-linux64.tar.gz
cp -r ./nvim/. $HOME/.config/lvim

#copy dotfiles
cp ./.zshrc $HOME/.zshrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp ./.tmux.conf $HOME/.tmux.conf

#copy fonts
cp -r ./fonts/* $HOME/.fonts/*
