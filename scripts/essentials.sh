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

echo ""
echo -n "Wanna install Papirus Icons ? [Y/n]: "
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    tempDir=$(mktemp -d)
    git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git "$tempDir"
    echo "Moving icons to /usr/share/icons"
    sudo mv "$tempDir/papirus-icon-theme/Papirus" /usr/share/icons/
    echo "Moved icons, removing temp files"
    rm -rf "$tempDir"
else
    echo "Skipped"
fi

sleep 0.5
echo "Konnichiwa Root Daemon !"
