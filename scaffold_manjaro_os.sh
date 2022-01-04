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
sudo pacman -S base-devel

# install neovim
sudo pacman -S neovim
sudo pacman -S ripgrep
sudo pacman -S xclip

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
sudo pacman -S docker
sudo pacman -S docker-compose
sudo pacman -S mkcert
sudo pacman -S homebank

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
yay -S ttf-ms-fonts
