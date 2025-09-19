#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm zsh \
    tldr \
    thefuck

yay -S --needed --noconfirm \
    zsh-antidote

curl -s https://ohmyposh.dev/install.sh | bash -s

sleep 1
echo "Installed thefuck, tldr, zsh, zsh-antidote"
