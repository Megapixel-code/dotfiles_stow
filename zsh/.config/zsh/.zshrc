#!/bin/sh

### source :
# aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

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
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu

### settings
setopt no_case_glob no_case_match # make completion case insensitive
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt globdots # lets files beginning with a . be matched without explicitly specifying the dot
unsetopt autocd # dont autocd


### colors settings
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   alias dir='dir --color=auto'
   alias vdir='vdir --color=auto'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


### custom prompt :
# get git branch ($vcs_info_msg_0_)
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' ( %b)'
# get vim mode [require plugin zsh_vi_mode]
# The plugin will auto execute this zvm_after_select_vi_mode function
vim_mode="[I]"
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
      vim_mode="[N]"
    ;;
    $ZVM_MODE_INSERT)
      vim_mode="[I]"
    ;;
    $ZVM_MODE_VISUAL)
      vim_mode="[V]"
    ;;
    $ZVM_MODE_VISUAL_LINE)
      vim_mode="[V-L]"
    ;;
    $ZVM_MODE_REPLACE)
      vim_mode="[R]"
    ;;
  esac
}

NEWLINE=$'\n'
PROMPT='${NEWLINE}${vcs_info_msg_0_} %n %~ ${vim_mode} ❯ '
zle && zle reset-prompt
