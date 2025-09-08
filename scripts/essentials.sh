#!/usr/bin/env bash

set -e

yay -S --needed --noconfirm \
    zsh-antidote

sudo pacman -S --needed --noconfirm \
    nodejs\
    npm\
    tmux\
    wl-clipboard \
    ripgrep \
    luarocks \
    python-pynvim \
    fd \
    git \
    neovim

sudo npm install -g neovim

sleep 0.5
echo "Konnichiwa Root Daemon !"
