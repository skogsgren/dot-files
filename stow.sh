#!/usr/bin/env bash

./jcs_gnome_term.sh

mkdir -p .config/nvim
mkdir -p .config/cmus
mkdir -p .config/ncspot
mkdir -p .config/mpv

cp -r nvim $HOME/.config
cp cmus/rc $HOME/.config/cmus/rc
cp ncspot/config.toml $HOME/.config/ncspot/config.toml
cp -r mpv $HOME/.config
