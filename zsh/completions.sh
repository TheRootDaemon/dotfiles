# Autocompletion configs
zstyle :compinstall filename '/home/therootdaemon/.zshrc'
autoload -Uz compinit
compinit

# Completion
[[ -f /home/therootdaemon/.dart-cli-completion/zsh-config.zsh ]] && . /home/therootdaemon/.dart-cli-completion/zsh-config.zsh || true
