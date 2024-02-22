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
alias "nnn"="nnn -de"
alias "n"="nnn"
alias "nn"="nnn"

# small plugin bindings for p:less; j:jq; m:headless mpv
export NNN_PLUG='p:-!less -inR "$nnn"*;j:-!cat "$nnn"* | jq . | less -inR;m:-!mpv --no-video "$nnn"*'
