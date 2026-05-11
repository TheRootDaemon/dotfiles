#pkgs!/usr/bin/env bash

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
    vim
)

installed=()

for pkg in "${bloats[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        installed+=("$pkg")
    fi
done

if ((${#installed[@]})); then
    sudo pacman -Rns "${installed[@]}"
fi

echo "All clean..."
