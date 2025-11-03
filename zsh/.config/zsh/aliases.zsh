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
   ls -Aohp --group-directories-first --time-style=iso --color=always $@ | sed -E '2,$s/ +[0-9]+//'
}

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias "git pr"="git pull --rebase"
alias lt='tree -a'
alias python=python3

