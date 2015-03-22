#
# Bash
#
. ~/.bin/bash-colors.sh
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
source ~/.bin/git-completion.bash

co() {
  git checkout $1
}
# these could live in .gitconfig
alias st="git status"
alias gpom="git pull origin master"
alias glog="git log --pretty=oneline --abbrev-commit --graph --decorate --all"
alias subpull="git submodule foreach git pull origin master"

function minutes_since_last_commit {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1`
  seconds_since_last_commit=$((now-last_commit))
  minutes_since_last_commit=$((seconds_since_last_commit/60))
  echo $minutes_since_last_commit
}
build_git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 1440 ]; then
      local COLOR=${RED}
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 60 ]; then
      local COLOR=${YELLOW}
    else
      local COLOR=${GREEN}
    fi
    local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"

    local BRANCH="${COLOR}%s${NORMAL}"
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=`__git_ps1 "[${BRANCH}](${SINCE_LAST_COMMIT})"`
    echo ${GIT_PROMPT}
  fi
}
export PS1="\h █ \W\$(build_git_prompt) \u\$ "

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
# Paths
#
export PATH=$PATH:~/bin

# NPM
export PATH=$PATH:/usr/local/share/npm/bin

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

# Original prompt:
# export PS1="\h:\W \u\$"
