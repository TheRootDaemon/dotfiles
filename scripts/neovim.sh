#!/usr/bin/env bash

set -e

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

sleep 1
echo "Installed neovim and it's dependencies"
