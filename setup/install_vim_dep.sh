#!/bin/bash
# setup script to install vim dependencies
#

sudo apt install -y \
    vim \
    vim-nox \
    vim-motif \
    universal-ctags \
    git \
    jq \
    xclip \
    wl-clipboard \
    shellcheck \
    curl \
    pipx

pipx install ruff

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
