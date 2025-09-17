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
alias py="python"
alias vim="nvim"
alias xnew="tmux new -s"
alias xconnect="tmux attach -t"
alias xkill="tmux kill-server"
alias update="sudo pacman -Syu && yay -Syu && flatpak update"
alias pacman="sudo pacman"

# Sourcing environments
act() {
    if [ -z "$1" ]; then
        if [ ! -f "bin/activate" ]; then
            echo "bin/activate Not Found"
            return 1
        else
            source bin/activate
            return 0
        fi
    fi

    if [ ! -f "$1/bin/activate" ]; then
        echo "$1/bin/activate Not Found"
        return 1
    fi

    source "$1/bin/activate"
}

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
eval $(thefuck --alias)
eval $(thefuck --alias fuck)
eval "$(oh-my-posh init zsh --config ~/dotfiles/oh-my-posh.json)"
echo ""

## [Completion]
[[ -f /home/therootdaemon/.dart-cli-completion/zsh-config.zsh ]] && . /home/therootdaemon/.dart-cli-completion/zsh-config.zsh || true
