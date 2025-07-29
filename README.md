# Dotfiles

Dotfiles of my Arch workflow, perfected for productivity...
Obviously according to my personal tastes !!

```bash
sudo pacman -Rns gnome-maps gnome-connections epiphany decibels gnome-contacts gnome-console gnome-music gnome-tour gnome-weather totem htop
```
The following command installs some utils for neovim 
```bash
yay -S zsh-antidote
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-noto-nerd
sudo pacman -S wl-clipboard ripgrep luarocks python-pynvim fd
sudo npm insatall -g neovim
```

I use symbolic links to point the dotfiles in my git repo, Since it is easy to maintain a repo !
```bash
ln -s <orginal dotfiles> <where to place the dotfiles>
```

For example, If I wanted to point to some of my dotfiles in my repo I will do This
```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/ghostty ~/.config/ghostty
```

That will create a symbolic link for me Since I am Lazy ...
