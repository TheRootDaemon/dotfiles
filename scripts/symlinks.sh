#!/usr/bin/bash

set -e

dotfiles="$HOME/dotfiles"

declare -A symlinks=(
    [".zshrc"]="$HOME/.zshrc"
    [".zsh_plugins.txt"]="$HOME/.zsh_plugins.txt"
    ["kitty"]="$HOME/.config/kitty"
    ["nvim"]="$HOME/.config/nvim"
    ["starship.toml"]="$HOME/.config/starship.toml"
    ["ghostty"]="$HOME/.config/ghostty"
    ["yazi"]="$HOME/.config/yazi"
)

for src in "${!symlinks[@]}"; do
    destination="${symlinks[$src]}"
    source="$dotfiles/$src"
    
    echo ""
    echo -n "Create symlink '$src'->'$destination' ? [Y/n]: "
    read -r response

    response="${response:-Y}"

    if [[ "$response" =~ ^[Yy]$ ]]; then
        if [ -e "$destination" ] || [ -L "$destination" ]; then
            rm -rf "$destination"
        fi

        ln -s "$source" "$destination"
        echo "Linked '$source'->'$destination'"
    else
        echo "Skipped '$source'->'$destination'"
    fi
done
