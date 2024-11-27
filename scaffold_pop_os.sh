#!/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install -y openvpn tmux zsh network-manager-openvpn neovim ripgrep xclip python-pip flameshot evolution evolution-ews bat btop pinta mkcert rclone rclone-browser ttf-mscorefonts-installer gpick
sudo apt install -y gnome-shell-extensions gtk2-engines-murrine gnome-tweaks fonts-firacode
sudo apt install -y curl git mercurial make binutils bison gcc build-essential

flatpak install flathub com.bitwarden.desktop flathub md.obsidian.Obsidian flathub io.dbeaver.DBeaverCommunity flathub com.visualstudio.code flathub com.microsoft.Edge 
flatpak install flathub com.spotify.Client org.clementine_player.Clementine org.videolan.VLC org.audacityteam.Audacity org.gnucash.GnuCash com.obsproject.Studio com.mattjakeman.ExtensionManager org.cryptomator.Cryptomator
flatpak install flathub com.protonvpn.www dev.fredol.open-tv 

# Download and install xdman manually

# Install docker with convenience script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt install docker-compose
