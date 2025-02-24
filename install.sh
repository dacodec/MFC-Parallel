#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

Update and install essential packages

echo "Updating system and installing essential packages..." sudo xbps-install -Su sudo xbps-install -y hyprland sddm xorg-server xdg-desktop-portal-hyprland 
wayland xwayland wlroots wofi foot swaylock grim slurp 
mako dunst polkit elogind pipewire wireplumber pipewire-pulse 
alsa-utils alsa-plugins pulseaudio-utils brightnessctl 
xdg-user-dirs xdg-utils network-manager-applet gvfs 
qt5-wayland qt6-wayland neovim git curl wget unzip

Enable SDDM

echo "Enabling SDDM service..." sudo ln -s /etc/sv/sddm /var/service/

Set up xdg-user-dirs

echo "Setting up user directories..." xdg-user-dirs-update

Set up PipeWire

echo "Enabling PipeWire..." sudo ln -s /etc/sv/pipewire /var/service/ sudo ln -s /etc/sv/wireplumber /var/service/

Done

echo "Installation and setup completed. Reboot your system and log in to Hyprland!"