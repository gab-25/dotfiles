#!/bin/bash

PATH=$(dirname $(realpath "$0"))
PATH_TMP="$PATH/tmp"

#install packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y htop net-tools fzf ripgrep vim postgresql-client python3-pip zsh curl

sudo snap install postman gimp inkscape mqtt-explorer

python3 -m pip install pip --upgrade

#install font Roboto
wget -O $PATH_TMP/roboto.zip 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip'
unzip -q $PATH_TMP/roboto.zip -d $PATH_TMP/roboto
rm $PATH_TMP/roboto.zip
mkdir -p $HOME/.local/share/fonts
cp -r $PATH_TMP/roboto/*.ttf $HOME/.local/share/fonts
rm -rf $PATH_TMP/roboto
fc-cache -fv

#install docker
curl -fsSL https://get.docker.com -o $PATH_TMP/get-docker.sh
sudo sh $PATH_TMP/get-docker.sh
rm $PATH_TMP/get-docker.sh
sudo usermod -aG docker $USER

#install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

#install neovim
wget -O $PATH_TMP/neovim.tar.gz 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'
tar xzvf neovim.tar.gz
mv neovim $HOME
rm neovim.tar.gz
ln -s ~/neovim/bin/nvim .local/bin/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

#install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo $PATH_TMP/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf $PATH_TMP/lazygit.tar.gz lazygit
install lazygit $HOME.local/bin
rm $PATH_TMP/lazygit.tar.gz

#install vs-code
wget -O $PATH_TMP/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y $PATH_TMP/vscode.deb
rm $PATH_TMP/vscode.deb 

#install dbeaver
wget -O $PATH_TMP/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo apt install -y $PATH_TMP/dbeaver.deb
rm $PATH_TMP/dbeaver.deb

#install virtualbox
wget -O $PATH_TMP/virtualbox.deb https://download.virtualbox.org/virtualbox/7.0.6/virtualbox-7.0_7.0.6-155176~Ubuntu~jammy_amd64.deb
sudo apt install -y $PATH_TMP/virtualbox.deb
rm $PATH_TMP/virtualbox.deb

#install google-chrome
wget -O $PATH_TMP/google-chrome.deb https://www.google.com/intl/it_it/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#
sudo apt install -y $PATH_TMP/google-chrome.deb
rm $PATH_TMP/google-chrome.deb

#install mongodb-compass
wget -O $PATH_TMP/mongodb-compass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.36.0_amd64.deb?_ga=2.181712164.2038150423.1678827658-1828552554.1678621412
sudo apt install -y $PATH_TMP/mongodb-compass.deb
rm $PATH_TMP/mongodb-compass.deb

#install github-cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#copy .vimrc
cp ./.vimrc $HOME/.vimrc

#copy .zshrc
cp ./.zshrc $HOME/.zshrc

#copy nvchad custom config
cp -r ./nvchad/* $HOME/.config/nvim/lua/
