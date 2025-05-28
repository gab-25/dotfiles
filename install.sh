#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y tmux neovim fzf fd-find ripgrep lazygit gcc zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
