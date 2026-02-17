#!/usr/bin/env bash

CONFIG_FILES="$HOME/.config/waybar/config.jsonc $HOME/.config/waybar/style.css"

trap "killall waybar" EXIT

if [ "$(dpkg -l | grep -i -c "inotify-tools")" -lt 1 ]; then
	echo "you must install inotify-tools"
	exit 1
fi

while true; do
	waybar &
	inotifywait -e create,modify "$CONFIG_FILES"
	killall waybar
done
