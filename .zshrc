powerline-daemon -q
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle history
antigen bundle sudo
antigen bundle common-aliases

antigen bundle zsh-users/zsh-syntax-highlighting

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

antigen theme agnoster

antigen apply

export LANG=en_US.UTF-8
export VISUAL=nano
export EDITOR="$VISUAL"
export GOPATH="$HOME/.go"
