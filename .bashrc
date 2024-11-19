# we want debian defaults
source /etc/skel/.bashrc

export GOPATH="$HOME/.go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dot-files/bin"
export DATE=$(date '+%Y-%m-%d')

if [ -x "$(command -v fzf)" ]; then
    # assuming debian location
    source /usr/share/doc/fzf/examples/key-bindings.bash
    export FZF_DEFAULT_COMMAND='fdfind --type f'
    export FZF_ALT_C_COMMAND='fdfind --exclude={calibre,dl,R,mail} --type d'
    source "$HOME/.dot-files/bash/fzf.bash"
fi

if [ -x "$(command -v nnn)" ]; then
    source "$HOME/.dot-files/bash/nnn.bash"
fi

if [ -x "$(command -v tmux)" ]; then
    source "$HOME"/.dot-files/bash/tmux-autocomplete.bash
    tmux has-session 2>/dev/null && tmux "ls"
fi

if [ -e "$HOME"/.dot-files/bash/secrets.bash ]; then
    source "$HOME"/.dot-files/bash/secrets.bash
fi

# ctrl-z as toggle between suspend and resume
if [[ $- == *i* ]]; then
  stty susp undef
  bind '"\C-z":" fg\015"'
fi
