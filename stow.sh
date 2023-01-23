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
cp .Xresources ~/.Xresources

# bashrc
filename="$HOME/.bashrc"
arr=("$HOME/.dot_files/.aliasrc"
     "/usr/share/doc/fzf/examples/completion.bash"
     "/usr/share/doc/fzf/examples/key-bindings.bash"
     "$HOME/.dot_files/tmux-autocomplete.sh")
for i in ${arr[@]};
do
    if ! grep -q -F "source $i" "$filename"; then
        echo "source "$i >> $filename
    fi
done

# bell
b="bind 'set bell-style none'"
if ! grep -q -F "$b" "$filename"; then
    echo $b >> $filename
fi

# tmux
t="if tmux has-session 2>/dev/null; then"
if ! grep -q -F "$t" "$filename"; then
    echo $t >> $filename
    echo "    tmux ls" >> $filename
    echo "fi" >> $filename
fi
