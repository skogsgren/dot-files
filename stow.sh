#!/usr/bin/env bash

cd ~/.dot-files

mkdir -p $HOME/.vim
mkdir -p $HOME/.config/ncspot
mkdir -p $HOME/.config/mpv

cp -r .vim $HOME/
cp -r .vimrc $HOME/
cp -r .gvimrc $HOME/
cp -r mpv $HOME/.config
cp .tmux.conf $HOME/.tmux.conf
cp .latexmkrc $HOME/.latexmkrc

# source external files in bashrc
filename="$HOME/.bashrc"
arr=("$HOME/.dot-files/.aliasrc"
     "/usr/share/doc/fzf/examples/key-bindings.bash"
     "$HOME/.dot-files/tmux-autocomplete.sh")
for i in ${arr[@]};
do
    if ! grep -q -F "source $i" "$filename"; then
        echo "source "$i >> $filename
    fi
done

# inputrc
inprc="$HOME/.inputrc"
bell="set bell-style none"
arr=("set bell-style none"
     "set show-all-if-unmodified on"
     "set show-all-if-ambiguous on")
if [ ! -f "$inprc" ]; then
    touch $inprc
fi
for i in ${arr[@]};
do
    if ! grep -q -F "source $i" "$inprc"; then
        echo "source "$i >> $inprc
    fi
done

# NOCOLOR environment variable
nocolor="export NO_COLOR='true'"
if ! grep -q -F "$nocolor" "$filename"; then
    echo $nocolor >> $filename
fi

# tmux
t="if tmux has-session 2>/dev/null; then"
if ! grep -q -F "$t" "$filename"; then
    echo $t >> $filename
    echo "    tmux ls" >> $filename
    echo "fi" >> $filename
fi
