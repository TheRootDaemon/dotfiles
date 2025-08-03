# Peanuts: Dotfiles curated for being a Better Nerd ✨
Welcome to my carefully curated collection of configurations that make my machine do exactly what I want, when I want it.

This is my home, messy in some corners, but perfectly organized where it counts.

Spending 69 hours configuring your terminal to save 3 seconds per day is totally worth it.

## 🎯 Quick Setup (For the Impatient)

```bash
# 1. Clone this beauty
git clone https://github.com/TheRootDaemon/peanuts.git ~/peanuts
cd ~/peanuts

# 2. Run the magic scripts
./scripts/essentials.sh  # Install the good stuff
./scripts/symlinks.sh    # Connect the dots
./scripts/bloat.sh       # Remove some bloatware
```

## 🔗 Manual Symlink Setup (For the Control Freaks)

If you don't trust my scripts (fair enough), here's the manual way:

```bash
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/ghostty ~/.config/ghostty
ln -s ~/dotfiles/hypr ~/.config/hypr
ln -s ~/dotfiles/yazi ~/.config/yazi
ln -s ~/dotfiles/tmux ~/.config/tmux
```

## 🎨 Features That'll Make You Jealous

- **Instant Productivity**: 0.3ms faster terminal startup (the difference is *chef's kiss*)
- **Muscle Memory Friendly**: Keybinds that make sense (revolutionary, I know)
- **Arch BTW**: Optimized for people who definitely use Arch by the way

## 🤝 Contributing

Found a bug? Have a suggestion? Want to argue about vim vs emacs?
Feel free to Open a discussion, shoot a PR or an Issue !
