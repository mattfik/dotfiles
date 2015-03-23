#
# Bash
#
alias ls='ls -laG'
alias ttop="top -R -F -s 10 -o rsize"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

gsub() {
  ack -l ${1} | xargs perl -i -p -e "s/${1}/${2}/g"
}

hist() {
  history | grep $1
}

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

#
# Git
#
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bin/gitprompt.sh
source ~/.bin/git-completion.bash

co() {
  git checkout $1
}

# these could live in .gitconfig
alias st="git s"
alias gpom="git pull origin master"
alias glog="git log --pretty=oneline --abbrev-commit --graph --decorate --all"
alias subpull="git submodule foreach git pull origin master"

#
# Rails
#
alias r="rails"
alias b="bundle exec"

export RAILS_ENV=development
rr() {
  b rake routes | grep $1
}
eval "$(rbenv init -)"

#
# Pow
#
export POW_TIMEOUT=3600

#
# Paths
#
export PATH=$PATH:~/bin
export PATH="~/.bin:$PATH"
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH

# NPM
# export PATH=$PATH:/usr/local/share/npm/bin

#
# Leanpub
#
alias worker="b rake worker:start"
alias tlpd="tail -f log/development.log"

#
# Other
#
ulimit -n 10000

# Use Sublime as default editor
export EDITOR="subl -w"
