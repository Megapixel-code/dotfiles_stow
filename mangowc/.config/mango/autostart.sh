#!/bin/sh

# cmd > /dev/null 2>&1 : used to discard output of cmd

# bar
waybar > /dev/null 2>&1 &

# blue light filter
sunsetr > /dev/null 2>&1 &

# deezer
# deezer-enhanced > /dev/null 2>&1 &

# background

# metropolis :
# swaybg -o "*" -i "$XDG_CONFIG_HOME/mango/backgrounds/metropolis.png" -m "fill" > /dev/null 2>&1 &
# swaybg -o "DP-1" -i "$XDG_CONFIG_HOME/mango/backgrounds/metropolis_horizontal.png" -m "fill" > /dev/null 2>&1 &
# swaybg -o "HDMI-A-1" -i "$XDG_CONFIG_HOME/mango/backgrounds/metropolis_vertical.png" -m "fill" > /dev/null 2>&1 &

# nixos
# swaybg -o "*" -i "$XDG_CONFIG_HOME/mango/backgrounds/nix-d-nord-purple.svg" -m "fill" > /dev/null 2>&1 &

# metropolis :
# swaybg -o "*" -i "$XDG_CONFIG_HOME/mango/backgrounds/pixel_art_city_horizontal.png" -m "fill" > /dev/null 2>&1 &
swaybg -o "DP-1" -i "$XDG_CONFIG_HOME/mango/backgrounds/pixel_art_city_horizontal.png" -m "fill" > /dev/null 2>&1 &
swaybg -o "HDMI-A-1" -i "$XDG_CONFIG_HOME/mango/backgrounds/pixel_art_city_vertical.png" -m "fill" > /dev/null 2>&1 &
