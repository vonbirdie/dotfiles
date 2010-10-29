#!/bin/bash

files=( ".bash_profile"
        ".bashrc"
        ".inputrc"
        ".screenrc" )

for file in $files
do
    echo "Installing $file"

    if [ -f "~/$file" ]; then
        rm -i "~/$file"
    fi

    ln $(echo $file | sed 's/\.\(.*\)/\1/') ~/$file
done
