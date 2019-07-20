#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

function set_rc() {
  [ -z "$1" ] && return
  [ -z "$2" ] && return

  stow --verbose --restow --target "${1}" "${2}"
}

function main() {
  local current_user="$(whoami)"
  local user_homedir="$(getent passwd "${current_user}" | cut -d: -f6)"
  echo "Running as ${current_user} and will install to ${user_homedir}"

  set_rc "${user_homedir}/bin" "bin"
  set_rc "${user_homedir}/.config/fish" "fish"
  set_rc "${user_homedir}/.config/nvim" "nvim"
  set_rc "${user_homedir}/" "git"
  set_rc "${user_homedir}/" "readline"
  set_rc "${user_homedir}/" "tmux"
  set_rc "${user_homedir}/" "zsh"
}

main

exit 0
