#!/usr/bin/env bash

mkdir -p .config/nvim
mkdir -p .config/cmus
mkdir -p .config/ncspot
mkdir -p .config/mpv

cp -r nvim $HOME/.config
cp cmus/rc $HOME/.config/cmus/rc
cp ncspot/config.toml $HOME/.config/ncspot/config.toml
cp -r mpv $HOME/.config

# bashrc
filename="../.bashrc"
arr=("$HOME/.dot_files/.aliasrc"
     "/usr/share/doc/fzf/examples/completion.bash"
     "/usr/share/doc/fzf/examples/key-bindings.bash"
     "$HOME/.dot_files/tmux-autocomplete.sh")
for i in ${arr[@]};
do
    echo $i
    if ! grep -q -F "source $i" "$filename"; then
        echo "source "$i >> $filename
    fi
done

# PS1
a='PS1="\[$(tput bold)\]\[\033[38;5;234m\]\u\[$(tput sgr0)\]@\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;239m\]\W\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"'
if ! grep -q -F "$a" "$filename"; then
    echo "export "$a >> $filename
fi
