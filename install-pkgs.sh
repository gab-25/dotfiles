#!/bin/bash

PATH=$(dirname $(realpath "$0"))
PATH_TMP="$PATH/tmp"

#install packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y htop net-tools fzf ripgrep vim postgresql-client python3-pip

sudo snap install postman gimp inkscape

python3 -m pip install pip --upgrade

#install docker
curl -fsSL https://get.docker.com -o $PATH_TMP/get-docker.sh
sudo sh $PATH_TMP/get-docker.sh
rm -r $PATH_TMP/get-docker.sh
sudo usermod -aG docker $USER

#install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

#install vs-code
wget -O $PATH_TMP/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y $PATH_TMP/vscode.deb
rm -r $PATH_TMP/vscode.deb 

#install dbeaver
wget -O $PATH_TMP/dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo apt install -y $PATH_TMP/dbeaver.deb
rm -r $PATH_TMP/dbeaver.deb

#install virtualbox
wget -O $PATH_TMP/virtualbox.deb https://download.virtualbox.org/virtualbox/7.0.6/virtualbox-7.0_7.0.6-155176~Ubuntu~jammy_amd64.deb
sudo apt install -y $PATH_TMP/virtualbox.deb
rm -r $PATH_TMP/virtualbox.deb

#install google-chrome
wget -O $PATH_TMP/google-chrome.deb https://www.google.com/intl/it_it/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#
sudo apt install -y $PATH_TMP/google-chrome.deb
rm -r $PATH_TMP/google-chrome.deb

#install mongodb-compass
wget -O $PATH_TMP/mongodb-compass.deb https://downloads.mongodb.com/compass/mongodb-compass_1.36.0_amd64.deb?_ga=2.181712164.2038150423.1678827658-1828552554.1678621412
sudo apt install -y $PATH_TMP/mongodb-compass.deb
rm -r $PATH_TMP/mongodb-compass.deb

#install chatgptcli
cp $PATH/chatgpt_cli $HOME/chatgpt_cli
$HOME/chatgpt_cli/setup.sh

#copy .vimrc
cp ./.vimrc $HOME/.vimrc

#add bash config
echo "source /usr/share/doc/fzf/examples/key-bindings.bash" >> $HOME/.bashrc
