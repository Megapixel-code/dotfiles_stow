#!/bin/bash

### source :
# .zprofile
[ -f "$HOME/.config/zsh/.zprofile" ] && source "$HOME/.config/zsh/.zprofile"
# zshfile config
[ -f "$HOME/.config/zsh/.zshrc" ] && source "$HOME/.config/zsh/.zshrc"

### plugins :
# plugin list
plug_locations=(
   "$ZDOTDIR/plugins/zsh_vi_mode/zsh-vi-mode.plugin.zsh" # have a real vi mode in terminal
)
# load plugins
for plug_loc in "${plug_locations[@]}"; do
   if [ -f "${plug_loc}" ]; then
      source "${plug_loc}"
   else
      echo "plugin not found at location : ${plug_loc}"
   fi
done

