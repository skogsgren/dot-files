#!/usr/bin/env bash

cd $HOME/.dot-files

# vim
cp $HOME/.vimrc $HOME/.dot-files/.vimrc
cp -r $HOME/.vim/after $HOME/.dot-files/.vim/
cp -r $HOME/.gvimrc $HOME/.dot-files/.gvimrc

# mpv
cp $HOME/.config/mpv/*.conf $HOME/.dot-files/mpv/
cp -r $HOME/.config/mpv/scripts $HOME/.dot-files/mpv/scripts

# tmux
cp $HOME/.tmux.conf $HOME/.dot-files/.tmux.conf

# latexmk
cp $HOME/.latexmkrc $HOME/.dot-files/.latexmkrc
