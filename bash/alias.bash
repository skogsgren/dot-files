DATE=$(date '+%Y-%m-%d')

alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias temp="sensors | egrep '(Package id 0)|(fan1)'"

alias rcp="rsync -rua --progress"

# bind tab to complete like vim
bind "TAB:menu-complete"
bind '"\e[Z":menu-complete-backward'

# ctrl-z as toggle between suspend and resume
if [[ $- == *i* ]]; then
  stty susp undef
  bind '"\C-z":" fg\015"'
fi

alias events="watch --color 'unbuffer khal list --format \"{tab}{bold}{title}{reset}{nl}{tab}: {start-time}-{end-time}{nl}{tab}{location}\" today 14d'"
