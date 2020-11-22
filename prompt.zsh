setopt prompt_subst

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}) "
ZSH_THEME_GIT_PROMPT_CLEAN="%{%F{green}%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%F{red}%}✗"


###### Based on https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh ####

# The git prompt's git commands are read-only and should not interfere with
# other processes. This environment variable is equivalent to running with `git
# --no-optional-locks`, but falls back gracefully for older versions of git.
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(__git_prompt_git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  STATUS=$(__git_prompt_git status --porcelain 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

###### Based on https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/clean.zsh-theme #####

PROMPT='%B%~%b $(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'


