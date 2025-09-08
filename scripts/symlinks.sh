#!/usr/bin/env bash

set -e

dotfiles="$HOME/dotfiles"

declare -A symlinks=(
    ["ghostty"]="$HOME/.config/ghostty"
    ["hypr"]="$HOME/.config/hypr"
    ["kitty"]="$HOME/.config/kitty"
    ["nvim"]="$HOME/.config/nvim"
    ["tmux"]="$HOME/.config/tmux"
    ["yazi"]="$HOME/.config/yazi"
    ["zshrc"]="$HOME/.zshrc"
    ["zsh_plugins.txt"]="$HOME/.zsh_plugins.txt"
)

for src in "${!symlinks[@]}"; do
    destination="${symlinks[$src]}"
    source="$dotfiles/$src"
    
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
