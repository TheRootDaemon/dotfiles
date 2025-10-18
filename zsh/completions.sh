# Autocompletion configs
zstyle :compinstall filename '/home/$(whoami)/.zshrc'
autoload -Uz compinit
compinit

# Completion
[[ -f /home/$(whoami)/.dart-cli-completion/zsh-config.zsh ]] && . /home/$(whoami)/.dart-cli-completion/zsh-config.zsh || true
