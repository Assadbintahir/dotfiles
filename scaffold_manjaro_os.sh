#!/bin/bash

# update your system
sudo pacman -Syyu

# install pamac (GUI package manager)
yay -S pamac-all

# Enable SSD TRIM
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

# check status of SSD TRIM
sudo systemctl status fstrim.timer

#install git
sudo pacman -S git curl nvidia-inst

# install system apps
sudo pacman -S openvpn networkmanager-openvpn base-devel tmux zsh

# install neovim
sudo pacman -S neovim
sudo pacman -S ripgrep
sudo pacman -S xclip

# install pip for python
sudo pacman -S python-pip

# install py neovim
pip install pynvim

# install user applications
sudo pacman -S libreoffice-still
sudo pacman -S flameshot
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

flatpak install flathub md.obsidian.Obsidian
flatpak install flathub us.zoom.Zoom
flatpak install flathub com.obsproject.Studio

yay -S microsoft-edge-stable-bin
yay -S cryptomator-bin
yay -S google-chrome
yay -S rclone rclone-browser
yay -S teams
yay -S visual-studio-code-bin
yay -S xdman
yay -S ttf-ms-fonts
