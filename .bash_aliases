alias update="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias temp="sensors | egrep '(Package id 0)|(fan1)'"
alias rcp="rsync -rua --progress"
alias events="watch --color 'unbuffer khal list --format \"{tab}{bold}{title}{reset}{nl}{tab}: {start-time}-{end-time}{nl}{tab}{location}\" today 14d'"
alias scratchpad='vim $(mktemp)'
alias spotdl-album='spotdl --output "({year}) {album}/{track-number} - {title}.{output-ext}"'
