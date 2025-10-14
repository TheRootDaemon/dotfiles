# History & other configs
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=500000
setopt nomatch

# Source dots
for dot in "$HOME"/dotfiles/zsh/*.sh; do
    source "$dot"
done

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
