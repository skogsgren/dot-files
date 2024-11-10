#!/bin/bash
gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
gsettings set org.gnome.desktop.interface monospace-font-name "Liberation Mono 9"
gsettings set org.gnome.desktop.interface font-name "Liberation Sans 10"
gsettings set org.gnome.desktop.wm.keybindings.move-to-center ["<Super>c"]
gsettings set org.gnome.desktop.input-sources.xkb-options ["caps:escape", "lv3:ralt_switch"]
