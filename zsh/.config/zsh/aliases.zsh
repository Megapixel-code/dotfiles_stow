#!/bin/sh

# du -sh {dir} show size of directory 

# A = show hidden files
# o = long listing format without group information
# h = humain readable
# p = indicator for dirs (/)
# group-directories-first = pretty explicit
# time-style=iso = show either Y-M-D or M-D H:m depending if current year or not
# color=always = forces color
# sed -> removes the second argument (number of hard links)
ll() {
   ls -Aohp --group-directories-first --time-style=iso --color=always | sed -E '2,$s/ +[0-9]+//'
}

alias lt='tree -a'
alias python=python3
