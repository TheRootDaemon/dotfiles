**Dotfiles curated for being a Better Nerd, They make your machine truly yours too...**

Welcome to my carefully curated collection of configurations that make my machine do exactly what I want, when I want it. This is my home, messy in some corners, but perfectly organized where it counts.

Spending **69 hours** configuring your terminal to save **3 seconds per day** is totally worth it.

**Quick Setup (For the Impatient)**
```bash
# 1. Clone this beauty
git clone https://github.com/TheRootDaemon/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Run the magic scripts
./scripts/essentials.sh  # Install the good stuff
./scripts/symlinks.sh    # Connect the dots
./scripts/bloat.sh       # Remove some bloatware
```

**Manual Symlink Setup (For the Control Freaks)**<br>
If you don't trust my scripts (fair enough), here's the manual way:
```bash
ln -s {path/to/dots} {destination/to/dots}
```

Here's an example:
```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
```

**Features That'll Make You Jealous**
- **Instant Productivity**: 0.3ms faster terminal startup (the difference is *chef's kiss*)
- **Muscle Memory Friendly**: Keybinds that make sense (revolutionary, I know)
- **Arch BTW**: Optimized for people who definitely use Arch

**The following are the keymaps that I use a lot**

#### Some Essentials

| Mode   | Keybinding   | Action                           |
| ------ | ------------ | -------------------------------- |
| Normal | `<leader>w`  | Save current file (`:w`)         |
| Normal | `<leader>wq` | Save all files and quit (`:wqa`) |
| Normal | `<leader>q`  | Quit without saving (`:qa!`)     |
| Normal | `<leader>f` | Start a search and replace (`:%s/`)    |
| Visual | `J`        | Move selected lines **down** one step |
| Visual | `K`        | Move selected lines **up** one step   |

#### Some Plugin Related Keymaps

| Mode   | Keybinding  | Action               |
| ------ | ----------- | -------------------- |
| Normal | `<leader>e` | Toggle file explorer |
| Normal | `<leader>ff` | Find files |
| Normal | `<leader>fg` | Live grep  |
| Normal | `<leader>x` | Delete current buffer    |
| Normal | `<leader>n` | Cycle to next buffer     |
| Normal | `<leader>p` | Cycle to previous buffer |
| Normal | `K`        | Hover documentation |
| Normal | `ca`       | Code actions        |
| Normal | `gd`       | Go to definition    |
| Normal | `gr`       | Go to references    |
| Normal | `rn`       | Rename symbols      |

**Contributing**

Found a bug? Of course there are bugs. Want to start an argument? Perfect.
Open up a Issue, Shoot a PR, Let's spend **69** more hours to curate the dots.
