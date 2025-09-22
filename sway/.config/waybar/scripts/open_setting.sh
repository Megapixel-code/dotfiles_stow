#!/bin/bash

LAST_PID=`cat ~/.config/waybar/scripts/settings.pid`
kill $LAST_PID $((LAST_PID+1))

if [ $? -ne 0 ]
then 
   sway mouse_warping none

   `$1` &
   PID="$!"
   echo "$PID" > ~/.config/waybar/scripts/settings.pid
   sway for_window [pid="$((PID+1))"] floating enable
   sway for_window [pid="$((PID+1))"] resize set height 436
   sway for_window [pid="$((PID+1))"] resize set width 456
   # x = 1920 - 456
   # y = 1080 - 42 - 436
   sway for_window [pid="$((PID+1))"] move position 1464 px 602 px

   wait $PID
   sway mouse_warping container
fi



