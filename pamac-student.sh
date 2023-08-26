#!/bin/bash

sudo mv /etc/sudoers.d/10-installer{,.bak}
sudo cat << EOF > /etc/sudoers.d/10-installer
%wheel ALL=(ALL) NOPASSWD: ALL
EOF

#sudo useradd -mU -u 1001 -g 1001 -G sys,games,network,scanner,power,users,video,uucp,optical,lp,audio,utmp,wheel admin
sudo usermod -aG sys,games,network,scanner,power,users,video,uucp,optical,lp,audio,utmp,wheel admin
sudo useradd -mU -u 1002 -g 1002 -G sys,games,network,scanner,power,video,optical,lp,audio,autologin alumno

sudo chpasswd < chpasswd.txt

pamac install nano vim neovim{,-qt} xclip wl-clipboard screen cronie htop btop glances bat exa catimg w3m neofetch psensor gnome-disk-utility timeshift-autosnap-manjaro kitty supertux{,kart} bsd-games words gnome-games tracker3{,-miners} libretro-*

#sudo systemctl status cronie
sudo systemctl enable --now cronie
sudo systemctl enable --now sshd

cd /home
sudo chown -R 1001:1001 admin
timeshift-launcher
sudo nano /etc/passwd
