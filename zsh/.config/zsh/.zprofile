#!/bin/sh

### follow XDG base dir specification https://wiki.archlinux.org/title/XDG_Base_Directory
# main
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# partialy suported
export CARGO_HOME"$XDG_CACHE_HOME/cargo"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="nvim"
export BROWSER="firefox"

# apache tomcat config temp
export CATALINA_HOME="$HOME/documents/web/school_jee_apache_tomcat"
export JAVA_HOME="/usr/lib/jvm/default-java"
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export PATH
export JRE_HOME
