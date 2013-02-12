#!/bin/sh
#
# Homebrew
#
# Install the most important Homebrew packages

# Check for Homebrew
if test ! $(which brew)
then
    echo "  x You should probably install Homebrew first:"
    echo "    https://github.com/mxcl/homebrew/wiki/installation"
    exit
fi

# Install homebrew packages
brew install grc ack tmux

exit 0
