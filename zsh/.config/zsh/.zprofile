#!/bin/sh

### follow XDG base dir specification https://wiki.archlinux.org/title/XDG_Base_Directory
# main
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# partialy suported
export CARGO_HOME"$XDG_CACHE_HOME/cargo"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="nvim"
export TERM="kitty"
export BROWSER="firefox"



[ -f "$HOME/.config/zsh/.zshrc" ] && source "$HOME/.config/zsh/.zshrc"
