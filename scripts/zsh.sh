#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm zsh \
    tldr \
    tree \
    tmux

yay -S --needed --noconfirm \
    zsh-antidote

curl -s https://ohmyposh.dev/install.sh | bash -s

sleep 1
echo "Installed tldr, tree, tmux, zsh, zsh-antidote"
