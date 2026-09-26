FROM archlinux

RUN pacman -Syu --noconfirm --needed \
    git \
    neovim \
    lua-language-server \
    stylua \
    tree-sitter-cli \
    ripgrep \
    fd \
    fzf \
    base-devel \
    curl \
    unzip

# checks whether neovim is atleast 0.12
RUN nvim --version | head -1 | grep -qE 'NVIM v0\.(1[2-9]|[2-9][0-9])\.'

WORKDIR /root/.config

CMD ["bash"]
