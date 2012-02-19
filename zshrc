#!/bin/zsh

# setup some basic variables
: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}


# ----------------------------------------------------------------------
#  SHELL OPTIONS
# ----------------------------------------------------------------------

#fpath=(~/.zsh/functions $fpath)
#autoload -U ~/.zsh/functions/*(:t)

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
setopt HIST_NO_STORE # don't store the history command
setopt SHARE_HISTORY # share history between terminal sessions

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

# default umask
umask 0022

bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char


# ----------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------

# we want the various sbins on the path along with /usr/local/bin
PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

# put ~/bin on PATH if it exists
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"


# ----------------------------------------------------------------------
# EDITOR
# ----------------------------------------------------------------------

export EDITOR=vim

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER

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
# MACOS X / DARWIN SPECIFIC
# ----------------------------------------------------------------------

if [ "$UNAME" = Darwin ]; then
    # setup java environment. puke.
    JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
    ANT_HOME="/Developer/Java/Ant"
    export ANT_HOME JAVA_HOME
fi

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
# LS
# ----------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON="lhBG"

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
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

# Use the color prompt by default when interactive
prompt_color
