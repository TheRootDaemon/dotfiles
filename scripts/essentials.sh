#!/usr/bin/bash

set -e

yay -S --needed --noconfirm \
    zsh-antidote \
    ttf-cascadia-code-nerd

sudo pacman -S --needed --noconfirm \
    nodejs\
    npm\
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-noto-nerd \
    tmux\
    wl-clipboard \
    ripgrep \
    luarocks \
    python-pynvim \
    fd \
    git \
    neovim \
    kitty

sudo npm install -g neovim

sleep 0.5
echo "Konnichiwa Root Daemon !"
