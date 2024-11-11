# activate venv in $HOME/.venv directory using fzf
function venva() {
    local selected_env
    selected_env=$(ls ~/.venv/ | fzf)
    if [ -n "$selected_env" ]; then
        source "$HOME/.venv/$selected_env/bin/activate"
    fi
}

# mount gvfs mount using ssh config & fzf
function gvfsm() {
    local sel
    GVFSDIR="$HOME/gvfs"
    sel=$(awk '/^HostName / {host=$2} /^User / {user=$2; print user"@"host}' ~/.ssh/config | fzf)
    if [ -n "$sel" ]; then
        gio mount "sftp://$sel"
        USER=$(echo "$sel" | cut -f 1 -d "@")
        HOST=$(echo "$sel" | cut -f 2 -d "@")
        cd "$GVFSDIR/sftp:host=$HOST,user=$USER" || return
    fi
}

# unmount gvfs mount using ssh config & fzf
function gvfsum() {
    local sel
    sel=$(awk '/^HostName / {host=$2} /^User / {user=$2; print user"@"host}' ~/.ssh/config | fzf)
    if [ -n "$sel" ]; then
        gio mount -uf "sftp://$sel"
    fi
}

# play internet radio from declaration json
function radio {
    local STATION
    local URL
    STATION=$(jq -r "keys[]" "$HOME"/.dot-files/bash/radio-stations.json | fzf)
    URL=$(jq -r .\""$STATION"\" "$HOME"/.dot-files/bash/radio-stations.json)
    if [[ $URL == "null" ]]; then
        return 1
    fi
    mpv --no-video --no-resume-playback "$URL"
}
