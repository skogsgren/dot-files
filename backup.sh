#!/usr/bin/env bash

cd $HOME/.dot_files

# vim
cp $HOME/.vimrc $HOME/.dot_files/.vimrc
cp -r $HOME/.vim/colors $HOME/.dot_files/.vim/
cp -r $HOME/.vim/after $HOME/.dot_files/.vim/
cp -r $HOME/.gvimrc $HOME/.dot_files/.gvimrc

# cmus
cp $HOME/.config/cmus/rc $HOME/.dot_files/cmus/rc

# ncspot
cp $HOME/.config/ncspot/config.toml $HOME/.dot_files/ncspot/config.toml

# mpv
cp $HOME/.config/mpv/*.conf $HOME/.dot_files/mpv/

# tmux
cp $HOME/.tmux.conf $HOME/.dot_files/.tmux.conf

# latexmk
cp $HOME/.latexmkrc $HOME/.dot_files/.latexmkrc

# Xresources
cp $HOME/.Xresources .Xresources

# check git status
gs="$(git status | grep -i "modified")"
# echo "${gs}"

# if there is a new change
if [[ $gs == *"modified"* ]]; then
  echo "push"
fi

git add -u;
git commit -m "`date +'%Y-%m-%d %H:%M:%S'`";
git push origin main
