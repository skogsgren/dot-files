# shellcheck disable=SC2016
# shellcheck disable=SC2089
# shellcheck disable=SC1090
# shellcheck disable=SC2090
nnn ()
{
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    command nnn "$@"
    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

# enables trash-cli
export NNN_TRASH=1

# nnn alias
alias "n"="nnn"
alias "nn"="nnn"

export NNN_SSHFS='sshfs -o reconnect'

NNN_BMS="m:$HOME/.config/nnn/mounts;"
NNN_BMS+="k:$HOME/.config/nnn/mounts/ko/;"
NNN_BMS+="n:$HOME/.config/nnn/mounts/nas/;"
NNN_BMS+="t:/tmp/"
export NNN_BMS

# small plugin bindings for
#   p:less
#   j:jq
#   m:headless mpv
#   c:copy filename to clipboard
NNN_PLUG='p:-!less "$nnn"*;'
NNN_PLUG+='j:-!cat "$nnn"* | jq . | less -inR*;'
NNN_PLUG+='m:-!mpv --no-video "$nnn"*;'
NNN_PLUG+='v:-!&mpv --no-resume-playback "$nnn"*;'
NNN_PLUG+='c:-!echo "$nnn"* | xclip -i -selection clipboard *'
export NNN_PLUG
