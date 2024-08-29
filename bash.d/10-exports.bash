#!/bin/bash
#
export MANPATH=$MANPATH:$HOME/man

# Source completions
for fn in $(find ${HOME}/dotfiles/bash.completions.d/ -type f)
do
    . ${fn}
done

# Add ~/bin to PATH
if [ -d "$HOME/bin" ]
then
    export PATH=${PATH}:${HOME}/bin
fi

# Add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ]
then
    export PATH=${PATH}:${HOME}/.local/bin
fi

# Add aliases
alias dc='docker compose'
