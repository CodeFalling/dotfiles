# Mental note: this is sourced for *interactive* sessions

PLATFORM=`uname -s`

# Set up completion
fpath=(~/.zsh/zsh-completions $fpath)
setopt dvorak
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit

# Set up history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt sharehistory appendhistory extendedglob notify histignorealldups

# Set up key bindings
bindkey -v    # vi-like bindings
bindkey  history-incremental-search-backward

# Widget to show which mode we're in
VIMODE=I

function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/C}/(main|viins)/I}"
  zle reset-prompt
}

zle -N zle-keymap-select

# Set up locale
export LANG=en_GB.UTF-8

# Set up prompt
fpath=(~/.zsh/zsh-git/functions $fpath)
setopt prompt_subst
autoload -U promptinit
promptinit
prompt wunjo

# Enable colour in programs that notice $CLICOLOR
export CLICOLOR=1

# Some useful aliases
alias g=git
alias r=rails
alias rvim='gvim --remote'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


# Platform-specific sections
if [[ $PLATFORM = 'Darwin' ]]; then
  alias l=launch
  alias gitx='launch -i nl.frim.GitX'
  alias gvim=mvim
fi
