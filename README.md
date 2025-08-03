# 🏠 Dotfiles of Legends

> *"Because spending 47 hours configuring your terminal to save 3 seconds per day is totally worth it"* 

Welcome to my carefully curated collection of configurations that make my computer do exactly what I want, when I want it. This is my digital home - messy in some corners, but perfectly organized where it counts.

## 🚀 What's Inside This Digital Toolshed

- **🐚 Zsh Config**: Because bash is so 2005
- **✨ Oh My Posh**: Terminal bling that sparks joy
- **🔥 Neovim**: The editor that vim users tell their therapist about
- **📱 Tmux**: Window management for people who have trust issues with GUI
- **👻 Ghostty**: Terminal that's faster than your excuses
- **🐱 Kitty**: Another terminal (yes, I have commitment issues)
- **🌊 Hyprland**: Wayland compositor that makes X11 cry
- **📁 Yazi**: File manager that actually makes sense
- **⚡ Scripts**: Automation because manual work is for peasants

## 🎯 Quick Setup (For the Impatient)

```bash
# 1. Clone this beauty
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# 2. Run the magic scripts
./scripts/essentials.sh  # Install the good stuff
./scripts/symlinks.sh    # Connect the dots
./scripts/bloat.sh       # Remove the corporate bloatware

# 3. Logout, login, and pretend you're a hacker
```

## 🔗 Manual Symlink Setup (For the Control Freaks)

If you don't trust my scripts (fair enough), here's the manual way:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/ghostty ~/.config/ghostty
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/yazi ~/.config/yazi
ln -sf ~/dotfiles/tmux ~/.config/tmux
```

## 📋 Prerequisites

```bash
# Essential packages (because nothing works without them)
sudo pacman -S zsh neovim tmux ripgrep fd wl-clipboard
yay -S zsh-antidote

# Fonts (because Comic Sans isn't cutting it)
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-noto-nerd

# Node.js stuff (because everything needs JavaScript now)
sudo npm install -g neovim
```

## 🎨 Features That'll Make You Jealous

- **Instant Productivity**: 0.3ms faster terminal startup (the difference is *chef's kiss*)
- **Muscle Memory Friendly**: Keybinds that make sense (revolutionary, I know)
- **Battery Included**: Everything configured, nothing to think about
- **Arch BTW**: Optimized for people who definitely use Arch BTW

## 🚨 Warning

Using these dotfiles may cause:
- Sudden urges to rewrite everything in Rust
- Uncontrollable desire to rice your desktop
- Inability to use default configurations
- Strong opinions about text editors
- Compulsive `neofetch` usage

## 🤝 Contributing

Found a bug? Have a suggestion? Want to argue about vim vs emacs?
Open an issue or PR! I promise I only bite on Mondays.

## 📜 License

MIT License - Use it, abuse it, just don't blame me when your computer achieves sentience.

---

*"The best dotfiles are the ones you never have to think about"* - Some wise person, probably
