#!/bin/sh

function set_rc {
    [ -z "$1" ] && return
    echo "Setting ${1}..."
    [ -f ~/.${1} ] && [ ! -f ~/.${1}.bak ] && mv -f ~/.${1} ~/.${1}.bak
    ln -sf ~/dotfiles/${1} ~/.${1}
}

set_rc "inputrc"
set_rc "screenrc"
set_rc "vim"
set_rc "vimrc"
set_rc "gitconfig"
set_rc "bash_profile"
set_rc "bashrc"
set_rc "irbrc"

exit 0
