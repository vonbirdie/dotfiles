#!/bin/zsh

# setup some basic variables
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# readline inputrc
: ${INPUTRC=~/.inputrc}

# enable sv_SE locale w/ utf-8 encodings if not already configured
: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_CTYPE:="en_US.UTF-8"}
: ${LC_ALL:="en_US.UTF-8"}
export LANG LANGUAGE LC_CTYPE LC_ALL

# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

# bring in system zsh environment
test -r /etc/zsh/zprofile &&
      . /etc/zsh/zprofile

#fpath=(~/.zsh/functions $fpath)
#autoload -U ~/.zsh/functions/*(:t)

autoload -U compinit
compinit

REPORTTIME=10 # print elapsed time when more than 10 seconds

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# history
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_STORE
setopt SHARE_HISTORY

# scripts and functions
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS

# job control
setopt NO_HUP
setopt NO_BG_NICE
setopt NOTIFY

# completion
setopt COMPLETE_IN_WORD
setopt NO_LIST_BEEP

# prompting
setopt PROMPT_SUBST

# input/output
setopt CORRECT
setopt IGNORE_EOF

# disable core dumps
ulimit -S -c 0

# default umask
umask 0022


# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

# put ~/bin on PATH if it exists
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"
export PATH


# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

export EDITOR=nvim
export PAGER="less -FirSwX"
export MANPAGER="less -FiRswX"


# ----------------------------------------------------------------------
# PROMPT
# ----------------------------------------------------------------------

autoload -U colors && colors

if [ "$LOGNAME" = "root" ]; then
    COLOR1="%{$fg[red]%}"
    COLOR2="%{$fg[yellow]%}"
    P="#"
else
    COLOR1="%{$fg[blue]%}"
    COLOR2="%{$fg[yellow]%}"
    P="\$"
fi

prompt_color() {
    PS1="%{$fg[white]%}[${COLOR1}%n%{$fg[white]%}@${COLOR2}%m%{$fg[white]%}:${COLOR1}%~%{$fg[white]%}]${COLOR2}$P%{$reset_color%} "
    PS2="%{$fg[white]%}> %{$reset_color%}"
}


# ----------------------------------------------------------------------
# ALIASES / FUNCTIONS
# ----------------------------------------------------------------------

alias ..='cd ..'
alias p='pwd'
alias history='fc -l 1'


# ----------------------------------------------------------------------
# ZSH COMPLETION
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
# KEY BINDINGS
# ----------------------------------------------------------------------

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

bindkey '^R' history-incremental-search-backward


# ----------------------------------------------------------------------
# LS
# ----------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON="lhB"

alias ls="command ls -$LS_COMMON"

# these use the ls aliases above
alias ll="ls -A$LS_COMMON"
alias l="ls -$LS_COMMON"
alias l.="ls -d .*"


# -------------------------------------------------------------------
# USER SHELL ENVIRONMENT
# -------------------------------------------------------------------

# source ~/.shenv now if it exists
test -r ~/.shenv &&
      . ~/.shenv

if [[ -o interactive ]]; then
  # Use the color prompt by default when interactive
  prompt_color
fi

