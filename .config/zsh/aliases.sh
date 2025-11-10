# Aliases
alias vim="nvim"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias nginx="sudo nginx"
alias pacman="sudo pacman"
alias systemctl="sudo systemctl"

update() {
    sudo pacman -Syu
    yay -Syu
    flatpak update
}
