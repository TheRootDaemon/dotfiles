#!/usr/bin/env bash

set -e

sudo pacman -S --needed git base-devel

if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git ~/Downloads/yay

    cd ~/Downloads/yay
    makepkg -si --noconfirm

    rm -rf ~/Downloads/yay
else
    echo "$(command -v yay)"
fi
