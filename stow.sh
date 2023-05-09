#!/usr/bin/env bash

cd ~/.dot_files

mkdir -p $HOME/.vim
mkdir -p $HOME/.config/cmus
mkdir -p $HOME/.config/ncspot
mkdir -p $HOME/.config/mpv

cp -r .vim $HOME/
cp -r .vimrc $HOME/
cp -r .gvimrc $HOME/
cp cmus/rc $HOME/.config/cmus/rc
cp ncspot/config.toml $HOME/.config/ncspot/config.toml
cp -r mpv $HOME/.config
cp .tmux.conf $HOME/.tmux.conf
cp .latexmkrc $HOME/.latexmkrc

# bashrc
filename="$HOME/.bashrc"
arr=("$HOME/.dot_files/.aliasrc"
     "/usr/share/doc/fzf/examples/key-bindings.bash"
     "$HOME/.dot_files/tmux-autocomplete.sh")
for i in ${arr[@]};
do
    if ! grep -q -F "source $i" "$filename"; then
        echo "source "$i >> $filename
    fi
done

# various settings
arr=("bind 'set bell-style none'"
     "export NO_COLOR='true'")
for i in ${arr[@]};
do
    if ! grep -q -F "$i" "$filename"; then
        echo $i >> $filename
    fi
done

# tmux
t="if tmux has-session 2>/dev/null; then"
if ! grep -q -F "$t" "$filename"; then
    echo $t >> $filename
    echo "    tmux ls" >> $filename
    echo "fi" >> $filename
fi
