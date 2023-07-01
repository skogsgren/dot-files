#!/usr/bin/env bash

cd ~/.dot-files

mkdir -p $HOME/.vim
mkdir -p $HOME/.config/cmus
mkdir -p $HOME/.config/ncspot
mkdir -p $HOME/.config/mpv

cp -r .vim $HOME/
cp -r .vimrc $HOME/
cp -r .gvimrc $HOME/
cp cmus/rc $HOME/.config/cmus/rc
cp -r mpv $HOME/.config
cp .tmux.conf $HOME/.tmux.conf
cp .latexmkrc $HOME/.latexmkrc
cp .Xresources $HOME/.Xresources

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

# disable bell
inprc="$HOME/.inputrc"
bell="set bell-style none"

if [ ! -f "$inprc" ]; then
    echo "$bell" > "$inprc"
else
    echo "$bell" >> $filename
fi

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
