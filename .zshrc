# Enable color support
autoload -U colors && colors

#antigen bundle zsh-users/zsh-syntax-highlighting

export VISUAL=nano
export EDITOR="$VISUAL"
export DEFAULT_USER="sijmen"
export npm_config_prefix=~/.npm
export GOPATH="$HOME/.go"
export GPG_TTY=$(tty)

export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias g=git
alias gp="git push"
alias gs="git status"
alias gaa="git add -A"
alias gcm="git commit -m "
alias ls="ls --color=auto"
alias ll="ls -alh"
alias grep='grep --color'

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# xset b off

# Mapping for the HOME, END and DELETE keys. Might change between computers.
# To know the code of a key, execute cat, press enter, press the key, then Ctrl+C.
bindkey  "^[[7~"   beginning-of-line
bindkey  "^[[8~"   end-of-line
bindkey  "^[[3~"   delete-char
bindkey  "^[Od"    backward-word
bindkey  "^[Oc"    forward-word

# Load our custom PS1 prompt
. ~/dotfiles/prompt.zsh

# give suggestions on how to solve 'command not found' errors
# To make this work, install 'pkgfile' and run 'sudo pkgfile -u'
source /usr/share/doc/pkgfile/command-not-found.zsh

# press <escape><escape> to add/remove sudo to/from the previous command
source ~/dotfiles/ohmyzsh/plugins/sudo/sudo.plugin.zsh

# Ensure pasting never executes the commands directly
set zle_bracketed_paste
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Persistant history
source ~/dotfiles/ohmyzsh/lib/history.zsh

# Set colors for ls

export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
export LSCOLORS="Gxfxcxdxbxegedabagacad"


# Autocompletion
# Requires: zsh-completions
autoload -Uz compinit && compinit -i

zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Inline suggestions
# Install yay -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=059"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion) # Prefere history suggestions 
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=enabled
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *" #never suggest cd
bindkey '^ ' autosuggest-accept # Use ctrl+space to accept a suggestion


# Syntax highlighting
# Requires: zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


