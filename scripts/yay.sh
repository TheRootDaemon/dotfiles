#!/usr/bin/env bash

set -e

sudo pacman -S --needed git base-devel

tmpdir=$(mktemp -d -p /tmp yay-build-XXXX)

if ! command -v yay &>/dev/null; then
    git clone https://aur.archlinux.org/yay.git "$tmpdir"

    cd "$tmpdir"
    makepkg -si --noconfirm

    cd -
    rm -rf "$tmpdir"

    sleep 1
    echo "Installed Yay!"
else
    echo "Yay is already installed!"
    echo "$(command -v yay)"
fi
