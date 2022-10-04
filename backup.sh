#!/usr/bin/env bash

# nvim
cp $HOME/.config/nvim/init.vim $HOME/.dot_files/nvim/init.vim
cp -r $HOME/.config/nvim/ftplugin/ $HOME/.dot_files/nvim/
cp -r $HOME/.config/nvim/colors $HOME/.dot_files/nvim/
cp -r $HOME/.config/nvim/after $HOME/.dot_files/nvim/

# cmus
cp $HOME/.config/cmus/rc $HOME/.dot_files/cmus/rc

# mpv
cp $HOME/.config/mpv/*.conf $HOME/.dot_files/mpv/

# ncspot
cp $HOME/.config/ncspot/config.toml $HOME/.dot_files/ncspot/config.toml

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
