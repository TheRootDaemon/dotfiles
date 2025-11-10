#!/usr/bin/env bash

set -e

dotfiles="$HOME/dotfiles"

declare -A symlinks=(
    # terminal emulators
    ["kitty"]="$HOME/.config/kitty"
    ["ghostty"]="$HOME/.config/ghostty"

    # dev env
    ["nvim"]="$HOME/.config/nvim"
    ["tmux"]="$HOME/.config/tmux"
    [".zshrc"]="$HOME/.zshrc"
    [".zsh_plugins.txt"]="$HOME/.zsh_plugins.txt"

    # window manager
    ["hypr"]="$HOME/.config/hypr"
    ["rofi"]="$HOME/.config/rofi"
    ["waybar"]="$HOME/.config/waybar"
    ["swaync"]="$HOME/.config/swaync"
)

for src in "${!symlinks[@]}"; do
    destination="${symlinks[$src]}"
    source="$dotfiles/.config/$src"

    echo ""
    echo -n "Create symlink '$src'->'$destination' ? [Y/n]: "
    read -r response

    response="${response:-Y}"

    if [[ "$response" =~ ^[Yy]$ ]]; then
        if [ ! -d "$HOME/.config" ]; then
            mkdir "$HOME/.config"
        fi

        if [ -e "$destination" ] || [ -L "$destination" ]; then
            rm -rf "$destination"
        fi

        ln -s "$source" "$destination"
        echo "Linked '$source'->'$destination'"
    else
        echo "Skipped '$source'->'$destination'"
    fi
done
