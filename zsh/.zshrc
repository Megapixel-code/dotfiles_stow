#!/bin/sh


### source :
# aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
# .zprofile
[ -f "$HOME/.config/zsh/.zprofile" ] && source "$HOME/.config/zsh/.zprofile"
# syntax highlighting
# required : sudo apt install zsh-syntax-highlighting
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


### load modules
autoload -U colors && colors
# autocomplete / completion list
autoload -U compinit && compinit
zmodload zsh/complist


# make electron work / enable the display for XWindows (didnt manage to do it)
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# export DISPLAY=:0
# export ELECTRON_OZONE_PLATFORM_HINT=auto
# export ELECTRON_ENABLE_LOGGING=true


### history
HISTFILE="$XDG_CACHE_HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved


### completion options
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu


### settings
unsetopt autocd # dont autocd
setopt no_case_glob no_case_match # make cmp case insensitive


### custom prompt :
# get git branch ($vcs_info_msg_0_)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' ( %b)'

NEWLINE=$'\n'
PROMPT='${NEWLINE}${vcs_info_msg_0_} %n %~ ❯ '
