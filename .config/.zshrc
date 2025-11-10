# History & other configs
setopt nomatch
HISTSIZE=100000
SAVEHIST=500000
HISTFILE=~/.zsh_history
export SUDO_EDITOR=nvim

# Source dots
for dot in "$HOME"/dotfiles/.config/zsh/*.sh; do
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
eval "$(oh-my-posh init zsh --config ~/dotfiles/.config/oh-my-posh.json)"
echo ""
