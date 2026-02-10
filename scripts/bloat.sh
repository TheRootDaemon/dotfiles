#!/usr/bin/env bash

bloats=(
    gnome-maps
    gnome-connections
    epiphany
    decibels
    gnome-contacts
    gnome-console
    gnome-music
    gnome-tour
    gnome-weather
    totem
    htop
)

installed=()

for pkg in "${pkgs[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        installed+=("$pkg")
    fi
done

if ((${#installed[@]})); then
    sudo pacman -Rns "${installed[@]}"
fi

echo "All clean..."
