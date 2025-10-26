#! /usr/bin/env bash

if pgrep -x waybar >/dev/null; then
    killall -9 waybar
else
    waybar &
fi
