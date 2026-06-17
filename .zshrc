# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthewfikowski/.oh-my-zsh"

ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  git-open
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Theme
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
prompt pure

# Variables
export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR="code -w"

# Aliases
alias go="git open"
alias gpv="gh pr view"
alias gb="git b | FZF"
alias tf="terraform"
alias ls='ls -laG'
alias ttop="top -R -F -s 10 -o rsize"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
