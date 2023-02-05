export MANPATH=$MANPATH:$HOME/man

# Source completions
for fn in $(find ${HOME}/dotfiles/bash.completions.d/ -type f); do
    . ${fn}
done

# Add aliases
alias dc='docker compose'
