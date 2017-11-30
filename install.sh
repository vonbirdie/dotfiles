#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

function set_rc {
    [ -z "$1" ] && return
    [ -z "$2" ] && return

    echo "Linking ${1} to ${2}..."

    if [ -e "~/${2}" ]; then
      mv -f "~/${2}" "~/${2}.bak"
    fi

    ln -sf "~/dotfiles/${1}" "~/${2}"
}

set_rc "bin" "bin"
set_rc "fish" ".config/fish"
set_rc "gitconfig" ".gitconfig"
set_rc "inputrc" ".inputrc"
set_rc "nvim" ".config/nvim"
set_rc "tmux.conf" ".tmux.conf"
set_rc "zshrc" ".zshrc"

exit 0
