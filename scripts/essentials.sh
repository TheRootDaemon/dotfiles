#!/usr/bin/bash

set -e

yay -S --needed --noconfirm \
    zsh-antidote \
    ttf-cascadia-code-nerd

sudo pacman -S --needed --noconfirm \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-noto-nerd \
    wl-clipboard \
    ripgrep \
    luarocks \
    python-pynvim \
    fd \
    git \
    neovim \
    kitty

sudo npm install -g neovim
