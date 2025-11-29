#!/bin/sh
color_purple_light="CDB4DB" #CDB4DB
color_purple="9764B4AA" #9764B4
color_purple_dark="56336B" #56336B
color_pink_light="FFC8DD" #FFC8DD
color_pink_dark="FFAFCC" #FFAFCC
color_blue_light="BDE0FE" #BDE0FE
color_blue_dark="A2D2FF" #A2D2FF

# https://gitlab.com/mildlyparallel/pscircle
pscircle \
   --background-color="$color_pink_dark" \
	--link-color-min="$color_purple" \
	--link-color-max="$color_purple" \
	--dot-color-min="$color_purple" \
	--dot-color-max="$color_purple" \
	--dot-border-color-min="$color_purple" \
	--dot-border-color-max="$color_purple" \
	--tree-font-color=000000CC \
\
	--tree-font-size=12 \
	--tree-font-face="BlexMono Nerd Font Mono" \
   --tree-radius-increment=145 \
   --link-convexity=0.6 \
   --link-width=1.5 \
   --dot-radius=3 \
   --dot-border-width=2 \
\
   --daemonize=1 \
   --loop-delay=10 \
   --output="$XDG_CONFIG_HOME/mango/backgrounds/pscircle_out.png"\
   --output-width=3200 \
   --output-height=1800 \
\
   --show-root=1 \
   --collapse-threads=1 \
   --cpulist-show=0 \
   --memlist-show=0 \

swww img -o "HDMI-A-1" "$XDG_CONFIG_HOME/mango/backgrounds/nix_horizontal.png"

while inotifywait -e close_write "$XDG_CONFIG_HOME/mango/backgrounds/pscircle_out.png"; do
   swww img -o "DP-1" "$XDG_CONFIG_HOME/mango/backgrounds/pscircle_out.png"
done


