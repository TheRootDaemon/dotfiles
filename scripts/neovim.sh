#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm \
    nodejs npm tmux wl-clipboard \
    ripgrep \
    luarocks \
    python-pynvim \
    fd \
    git \
    neovim

# Language Servers
sudo pacman -S --needed --noconfirm \
    bash-language-server \
    lua-language-server \
    gopls \
    typescript-language-server \
    svelte-language-server \
    tailwind-language-server \
    pyright

sudo pacman -S --needed --noconfirm \
    stylua \
    shfmt \
    gofumpt \
    prettier

sudo npm install -g neovim

sleep 1
echo "Installed neovim and it's dependencies"
