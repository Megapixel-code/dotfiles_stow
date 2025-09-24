#!/bin/sh

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# make electron work / enable the display for XWindows (didnt manage to do it)
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export DISPLAY=:0
# export ELECTRON_OZONE_PLATFORM_HINT=auto
# export ELECTRON_ENABLE_LOGGING=true

# source
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# history
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=1000
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# settings
unsetopt autocd beep extendedglob nomatch notify

setopt no_case_glob no_case_match # make cmp case insensitive

# autocomplete
autoload -Uz compinit && compinit

# get git branch ($vcs_info_msg_0_)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' ( %b)'
# RPROMPT=\$vcs_info_msg_0_

NEWLINE=$'\n'
PROMPT='${NEWLINE}${vcs_info_msg_0_} %n %~ ❯ '

# syntax highlighting
# requires zsh-syntax-highlighting package
# sudo apt install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
