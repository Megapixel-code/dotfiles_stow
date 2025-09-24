#!/bin/sh

# history
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=1000
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# source
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

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
zstyle ':vcs_info:git:*' formats ' (%b)'
# RPROMPT=\$vcs_info_msg_0_

NEWLINE=$'\n'
PROMPT='${NEWLINE}${vcs_info_msg_0_}%b %n %~ ❯ '

# syntax highlighting
# requires zsh-syntax-highlighting package
# sudo apt install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
