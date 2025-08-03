export PATH="$HOME/.local/bin:$PATH"

# History & other configs
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000
setopt nomatch

# Autocompletion configs
zstyle :compinstall filename '/home/therootdaemon/.zshrc'
autoload -Uz compinit
compinit

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias py="python3"
alias vim="nvim"
alias xnew="tmux new -s"
alias xconnect="tmux attach -t"
alias xkill="tmux kill-server"
alias binact="source bin/activate"
alias update="sudo pacman -Syu && yay -Syu && flatpak update"
alias docker="sudo docker"
alias pacman="sudo pacman"

# Antidote configs (Plugin manager)
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

fpath=(/usr/share/zsh-antidote/functions $fpath)
autoload -Uz antidote

if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

source ${zsh_plugins}.zsh

# Startup
eval eval "$(oh-my-posh init zsh --config ~/peanuts/oh-my-posh.json)"
echo ""

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/therootdaemon/.dart-cli-completion/zsh-config.zsh ]] && . /home/therootdaemon/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

