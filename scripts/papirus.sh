#!/usr/bin/env bash

set -e

tempDir=$(mktemp -d)
git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git "$tempDir"

if [ -d "/usr/share/icons/Papirus" ]; then
    sudo rm -rf /usr/share/icons/Papirus
fi

echo "Moving icons to /usr/share/icons"
sudo mv "$tempDir/papirus-icon-theme/Papirus" /usr/share/icons/

echo "Moved icons, removing temp files"
rm -rf "$tempDir"

echo "Installed Papirus icon themes"
ls -la /usr/share/icons | grep Papirus
ls -la /usr/share/icons/Papirus
