# we want debian defaults
source /etc/skel/.bashrc

BASH_DIR=$HOME/.dot-files/bash/
source $BASH_DIR/exports.bash
source $BASH_DIR/nnn.bash
source $BASH_DIR/fzf.bash
if [ -e $BASH_DIR/secrets.bash ]; then
    source $BASH_DIR/secrets.bash
fi

# ctrl-z as toggle between suspend and resume
if [[ $- == *i* ]]; then
  stty susp undef
  bind '"\C-z":" fg\015"'
fi

if [ -x "$(command -v tmux)" ]; then
    tmux has-session 2>/dev/null && tmux ls
fi
