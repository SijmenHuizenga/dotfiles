powerline-daemon -q
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle history
antigen bundle sudo
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting

export ZSH=$HOME/.oh-my-zsh
export GNUPGHOME=$HOME/.ssh/gpg

export LANG=en_US.UTF-8
export VISUAL=nano
export EDITOR="$VISUAL"
export DEFAULT_USER="sijmen"
export npm_config_prefix=~/.npm
export GOPATH="$HOME/.go"

export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/allez/ops-tools/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"

alias tf=terraform
alias tfi="tf init"
alias tfa="tf apply"
alias tfp="tf plan"

alias g=git
alias gs="git status"
alias gaa="git add -A"
alias gcm="git commit -m "

antigen theme agnoster
antigen apply

xset b off
