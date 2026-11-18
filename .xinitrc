#!/bin/sh

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
        eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" >/dev/null
fi

export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=i3

[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"

xsetroot -solid '#00005f'
kbd-toggle-init
xset -dpms s off
exec i3
