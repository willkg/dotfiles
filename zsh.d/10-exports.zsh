#!/usr/bin/env zsh
#
export MANPATH=$MANPATH:$HOME/man

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

# Source completions
fpath=("$HOME/dotfiles/zsh.completions.d" $fpath)
autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' user-commands cleanup:'clean up an existing branch'

# Add aliases
alias dc='docker compose'
alias ls='ls -GFh'
