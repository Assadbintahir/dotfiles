#!/bin/bash

# Point to the Fastest Mirror
sudo pacman-mirrors --fasttrack

# update your system
sudo pacman -Syyu

# Enable SSD TRIM
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# check status of SSD TRIM
sudo systemctl status fstrim.timer

#install git
sudo pacman -S git curl

# install openvpn and network manager
sudo pacman -S openvpn networkmanager-openvpn

# install AUR and pacman helper yay
sudo pacman -S yay

# install neovim
sudo pacman -S neovim
sudo pacman -S ripgrep
sudo pacman -S xclip

# install ms fonts
yay -S ttf-ms-fonts

# install pip for python
sudo pacman -S python-pip

# install py neovim
pip install pynvim

# install snapd
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket

# install flatpak
sudo pacman -S flatpak libpamac-flatpak-plugin
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | zsh
source ~/.zshrc
nvm install v12.15.0
nvm use v12.15.0
nvm alias default v12.15.0
nvm use default

# install neovim node client
npm install -g neovim

# install gvm and golang
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.zshrc
gvm install go1.17.5 -B
gvm use go1.17.5 --default

# install mkcert
sudo pacman -S mkcert

# configure orchis theme
cd Downloads
git clone https://github.com/vinceliuice/Orchis-theme.git
./install.sh -t grey --tweaks compact
./install.sh -t grey --tweaks primary
cd

# install user applications
sudo pacman -S libreoffice-still
sudo pacman -S flameshot
sudo pacman -S gnome-shell-extension-pop-shell
sudo pacman -S alacritty
sudo pacman -S bitwarden
sudo pacman -S clementine
sudo pacman -S dbeaver
sudo pacman -S evolution evolution-ews
sudo pacman -S bat btop
sudo pacman -S opera
sudo pacman -S pinta
sudo pacman -S vlc

sudo flatpak install flathub nz.mega.MEGAsync
sudo flatpak install flathub md.obsidian.Obsidian
sudo flatpak install flathub us.zoom.Zoom

sudo snap install slack --classic

yay -S cryptomator-bin
yay -S google-chrome
yay -S microsoft-edge-stable-bin
yay -S rclone rclone-browser
yay -S teams
yay -S visual-studio-code-bin
yay -S xdman


# install docker and docker-compose
sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
newgrp docker

sudo pacman -S docker-compose

# setup portainer 
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

