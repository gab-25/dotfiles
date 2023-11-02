#!/bin/bash

PATH=$(dirname $(realpath "$0"))
PATH_TMP="$PATH/tmp"

#install packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y htop net-tools fzf ripgrep fd-find vim postgresql-client sqlite3 python3-pip zsh curl

sudo snap install gimp inkscape mqtt-explorer

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
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_18.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install -y nodejs

#install vs-code
wget -O $PATH_TMP/vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y $PATH_TMP/vscode.deb
rm $PATH_TMP/vscode.deb 

#install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o $HOME/nvim.appimage
chmod u+x $HOME/nvim.appimage
ln -s $HOME/nvim.appimage $HOME/.local/bin/nvim

#install dbeaver
sudo  wget -O /usr/share/keyrings/dbeaver.gpg.key https://dbeaver.io/debs/dbeaver.gpg.key
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg.key] https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update
sudo apt-get install -y dbeaver-ce

#install virtualbox
wget -O $PATH_TMP/virtualbox.deb https://download.virtualbox.org/virtualbox/7.0.6/virtualbox-7.0_7.0.6-155176~Ubuntu~jammy_amd64.deb
sudo apt install -y $PATH_TMP/virtualbox.deb
rm $PATH_TMP/virtualbox.deb

#install google-chrome
wget -O $PATH_TMP/google-chrome.deb https://www.google.com/intl/it_it/chrome/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0#
sudo apt install -y $PATH_TMP/google-chrome.deb
rm $PATH_TMP/google-chrome.deb

#install github-cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo $PATH_TMP/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf $PATH_TMP/lazygit.tar.gz $HOME/lazygit
sudo install $HOME/lazygit /usr/local/bin
rm $PATH_TMP/lazygit.tar.gz $HOME/lazygit

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


#install flutter
sudo snap install flutter --classic

#install android-studio
sudo snap install android-studio --classic

#install npm packages
sudo npm install -g @angular/cli @ionic/cli @nestjs/cli typescript

#copy nvim configs
cp -r ./nvim $HOME/.config/nvim

#copy .zshrc
cp ./.zshrc $HOME/.zshrc
