#!/bin/bash

# Check for fzf and install shell integration if it's there.
# https://junegunn.github.io/fzf/installation/
if [ -f "$HOME/bin/fzf" ]
then
    eval "$(fzf --bash)"
fi
