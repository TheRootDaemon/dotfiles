#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprlock \
    hypridle \
    hyprshot \
    hyprpaper \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    rofi \
    pavucontrol \
    wlsunset \
    waybar

yay -S --needed --noconfirm \
    nmgui-bin \
    wlogout

sleep 1
echo "Installed hyprland and its utilities"
