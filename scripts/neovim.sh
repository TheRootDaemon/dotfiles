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

sudo pacman -S --needed --noconfirm \
    bash-language-server \
    lua-language-server \
    clang \
    gopls \
    typescript-language-server \
    svelte-language-server \
    tailwindcss-language-server \
    pyright \
    yaml-language-server \
    vscode-css-languageserver \
    vscode-json-languageserver \
    vscode-html-languageserver

sudo pacman -S --needed --noconfirm \
    stylua \
    shfmt \
    gofumpt \
    prettier \
    python-black \
    python-isort

sudo npm install -g neovim

sleep 1
echo "Installed neovim and it's dependencies"
