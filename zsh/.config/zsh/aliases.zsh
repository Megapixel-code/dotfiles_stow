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

git() {
   if [[ $@ == "pr" ]]; then
      command git pull --rebase
      # if the rebase did not work do git rebase --abort
   else
      command git "$@"
   fi
}

cbonsai() {
   if [[ $@ != "" ]]; then
      command cbonsai "$@"
      return
   fi

   # gen colors
   leafs_dark=$((1 + "$RANDOM" % 7))

   bark_dark=$((1 + ("$leafs_dark" + "$RANDOM") % 7))
   while [[ bark_dark == leafs_dark ]]; do
      bark_dark=$((1 + ("$leafs_dark" + "$RANDOM") % 7))
   done

   leafs_light=$(("$leafs_dark" + 8))
   bark_light=$(("$bark_dark" + 8))

   # execute cmd
   command cbonsai -S --time=5 --wait=60 --base=2 --leaf="$" --color="$leafs_dark,$bark_dark,$leafs_light,$bark_dark" --multiplier=9 --life=45
   # command cbonsai -liWC --time=5 --wait=60 --base=2 --leaf="$" --color="$leafs_dark,$bark_dark,$leafs_light,$bark_dark" --multiplier=9 --life=45
}

alias "git pr"="git pull --rebase"
alias lt='tree -a'
alias python=python3
