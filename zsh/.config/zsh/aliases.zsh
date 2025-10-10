#!/bin/sh

# du -sh {dir} show size of directory 

# A = show hidden files
# o = long listing format without group information
# h = humain readable
# p = indicator for dirs (/)
# group-directories-first = pretty explicit
# time-style=iso = show either Y-M-D or M-D H:m depending if current year or not
# color=auto = add color
alias ll='ls -A -o -h -p --group-directories-first --time-style=iso --color=auto'

alias lt='tree -a'
