#!/bin/bash

function set_rc {
    [ -z "$1" ] && return
    echo "Setting ${1}..."
    [ -f ~/.${1} ] && [ ! -f ~/.${1}.bak ] && mv -f ~/.${1} ~/.${1}.bak
    ln -sf ~/dotfiles/${1} ~/.${1}
}

set_rc "inputrc"
set_rc "vim"
set_rc "vimrc"
set_rc "gitconfig"
set_rc "bash_profile"
set_rc "bashrc"
set_rc "irbrc"
set_rc "rdebugrc"
set_rc "htoprc"
set_rc "gemrc"
set_rc "tmux.conf"
set_rc "zshrc"

echo "Setting bin..."
ln -sf ~/dotfiles/bin ~/bin

exit 0
