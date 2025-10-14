#!/usr/bin/env bash

set -e

yay -S --needed --noconfirm \
    ttf-jetbrains-mono-nerd

sudo pacman -S --needed --noconfirm \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-noto-nerd \
    kitty \
    vlc \
    vlc-plugins-all

sleep 1
echo "Utils installed :)"
