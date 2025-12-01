#!/bin/sh
#1B1B3A
#693668
#A74482
#F84AA7
#FF3562

color_light="CF4794" #CF4794
color_dark="1B1B3A" #1B1B3A
color_mid="693668" #693668


# https://gitlab.com/mildlyparallel/pscircle
pscircle \
   --background-color="$color_light" \
	--link-color-min="$color_mid" \
	--link-color-max="$color_mid" \
	--dot-color-min="$color_dark" \
	--dot-color-max="$color_dark" \
	--dot-border-color-min="$color_dark" \
	--dot-border-color-max="$color_mid" \
	--tree-font-color="$color_dark" \
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
   swww img -o "DP-1" "$XDG_CONFIG_HOME/mango/backgrounds/pscircle_out.png" --transition-type "grow" --transition-pos "center"
done


