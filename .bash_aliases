alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias temp="watch -n 0.5 \"sensors | egrep '(Package id 0)|(fan1)'"\"
alias rcp="rsync -rua --progress"
alias scratchpad='vim $(mktemp)'
alias scratchpad-python='vim $(mktemp --suffix .py)'

alias spotdl-album='spotdl --output "({year}) {album}/{track-number} - {title}.{output-ext}"'

alias ipython='ipython3'
alias python='python3'
alias pydoc='pydoc3'
alias pytest="python3 -m pytest -v"

alias tsv-table="column -ts$'\t'"

alias gg="lazygit"

alias ls="ls --group-directories-first --color=auto"
