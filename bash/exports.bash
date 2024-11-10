export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dot-files/bin"

# fzf stuff
if [ -x "$(command -v fzf)" ]; then
    source /usr/share/doc/fzf/examples/key-bindings.bash
    export FZF_DEFAULT_COMMAND='fdfind --type f'
    export FZF_ALT_C_COMMAND='fdfind --exclude={calibre,dl,R} --type d'
    source "$HOME/.dot-files/bash/fzf.bash"
fi

# tmux autocomplete
if [ -x "$(command -v tmux)" ]; then
    source "$HOME"/.dot-files/bash/tmux-autocomplete.bash
fi

# source nnn plugins
if [ -x "$(command -v tmux)" ]; then
    source "$HOME/.dot-files/bash/nnn.bash"
fi

# always source alias file
source "$HOME/.dot-files/bash/alias.bash"
