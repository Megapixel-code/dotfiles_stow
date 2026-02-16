#!/usr/bin/env bash

LAST_PID=$(cat ~/.config/waybar/scripts/settings.pid)

if [[ ! $( kill "$LAST_PID" $((LAST_PID + 1)))  ]]; then
	sway mouse_warping none

	MARGIN=130

	kitty "$1" &
	PID="$!"
	echo "$PID" > ~/.config/waybar/scripts/settings.pid

	sway for_window [pid="$((PID + 1))"] floating enable
	sway for_window [pid="$((PID + 1))"] resize set width $((1920 - MARGIN))
	sway for_window [pid="$((PID + 1))"] resize set height $((1080 - MARGIN))

	wait $PID
	sway mouse_warping container
fi
