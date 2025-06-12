# Dotfiles

This repo contains configs for, 

- Starship
- Neovim
- Ghostty
- zsh
- tmux

The following command installs the plugin manager for zsh
```bash
sudo pacman -S zsh-antidote
```
The following command installs some utils for neovim 
```bash
sudo pacman -S wl-clipboard ripgrep luarocks python-pynvim
sudo npm insatall -g neovim
```
Make sure to install tmux plugin manager before using configs for tmux
Also i used the $HOME/.config format
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

I use symbolic links to point dotfile in my git repo, Since it is very friendly to lazy people
```bash
ln -s <orginal dotfiles> <where to place the dotfiles>
```

For example, If I wanted to point to some of my dotfiles in my repo I will do This
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/ghostty ~/.config/ghostty
```

That will create a symbolic link for me Since I am Lazy ...
I might add a few more in future ......

