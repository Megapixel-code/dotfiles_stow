#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

if [ "$(dpkg -l | grep -i "inotify-tools" | wc -l)" -lt 1 ];then
	echo "you must install inotify-tools"
	exit -1
fi

while true; do
    waybar &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
