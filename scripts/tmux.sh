#!/usr/bin/env bash

set -e

sudo pacman -S --needed --noconfirm tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sleep 1
echo "Installed tmux, tmux plugin manager"
