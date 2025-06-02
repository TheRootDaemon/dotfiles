# History & other configs
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000
setopt nomatch

# Autocompletion configs
zstyle :compinstall filename '/home/peanut/.zshrc'
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
alias sqlite="sqlite3"
alias binact="source bin/activate"

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
eval "$(starship init zsh)"
