#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl vim fd-find ripgrep python3 python3-pip nodejs npm

#install anaconda
python install_anaconda3.py

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install neovim
curl -O https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz

#install lazygit
curl -O https://github.com/jesseduffield/lazygit/releases/download/v0.44.1/lazygit_0.44.1_Linux_x86_64.tar.gz

#install lunarvim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

#install nerdfont
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf
fc-cache -f -v

#copy dotfiles
cp ./.zshrc $HOME/.zshrc
cp ./.vimrc $HOME/.vimrc
cp ./.gitconfig $HOME/.gitconfig
cp -r ./zed/* $HOME/.config/zed
