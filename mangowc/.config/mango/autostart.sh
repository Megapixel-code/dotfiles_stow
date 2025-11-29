#!/bin/sh

# cmd > /dev/null 2>&1 : used to discard output of cmd

# obs
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots > /dev/null 2>&1

# bar
waybar > /dev/null 2>&1 &

# blue light filter
sunsetr > /dev/null 2>&1 &

# deezer
# deezer-enhanced > /dev/null 2>&1 &

# wallpaper
# start daemon :
swww-daemon > /dev/null 2>&1 &

# pscircle
"$XDG_CONFIG_HOME/mango/scripts/pscircle_bg.sh" > /dev/null 2>&1 &
