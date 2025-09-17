<div align="center">
 <img src="dotfiles.png" height="200">
</div>

<p align="center">
 <img src="https://img.shields.io/badge/Arch-363a4f?style=for-the-badge&logo=arch-linux&logoColor=1793D1" height="35">
 <img src="https://img.shields.io/badge/Neovim-363a4f?style=for-the-badge&logo=neovim&logoColor=a6da95" height="35">
 <img src="https://img.shields.io/badge/Lua-363a4f?style=for-the-badge&logo=lua&logoColor=8aadf4" height="35">
 <img src="https://img.shields.io/badge/Tmux-363a4f?style=for-the-badge&logo=tmux&logoColor=f5a97f" height="35">
 <img src="https://img.shields.io/badge/Zsh-363a4f?style=for-the-badge&logo=zsh&logoColor=c6a0f6" height="35">
 <img src="https://img.shields.io/badge/Oh%20My%20Posh-363a4f?style=for-the-badge&logo=hackthebox&logoColor=ed8796" height="35">
 <img src="https://img.shields.io/badge/Starship-363a4f?style=for-the-badge&logo=starship&logoColor=f4dbd6" height="35">
 <img src="https://img.shields.io/badge/Shell-363a4f?style=for-the-badge&logo=shell&logoColor=91d7e3" height="35">
</p>

---
**Dotfiles curated for being a Better Nerd, They make your machine truly yours too...**

Welcome to my carefully curated collection of configurations that make my machine do exactly what I want, when I want it. This is my home, messy in some corners, but perfectly organized where it counts.

Spending **69 hours** configuring your terminal to save **3 seconds per day** is totally worth it.

---
**Quick Setup Guide**:

- For **Arch by the way** people
```bash
# 1. Clone this beauty
git clone https://github.com/TheRootDaemon/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Run the magic scripts
./scripts/yay.sh         # Install yay
./scripts/essentials.sh  # Install the good stuff
./scripts/utils.sh       # Install the Utils fonts and stuff
./scripts/symlinks.sh    # Connect the dots
./scripts/bloat.sh       # Remove some bloatware
```

- For the **WSL** guys who got stuck with hell. I've been there too :)
```bash
# Before doing this make sure you have created users with proper permissions
git clone https://github.com/TheRootDaemon/dotfiles.git ~/dotfiles
cd ~/dotfiles

./scripts/yay.sh
./scripts/essentials.sh
./scripts/symlinks.sh
```

Also here are the [keymaps](KEYMAPS.md) that I use.

---
**Manual Symlink Setup (For the Control Freaks)**:<br>

If you don't trust my scripts (fair enough), here's the manual way:
```bash
ln -s {path/to/dots} {destination/to/dots}
```

Here's an example:
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

---
**Contributing**:

Found a bug? Of course there are bugs. Want to start an argument? Perfect.
Open up a Issue, Shoot a PR, Let's spend **69** more hours to curate the dots.
