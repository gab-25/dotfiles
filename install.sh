#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y tmux vim fzf fd-find ripgrep gcc lazygit

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
