# .bash_profile

# User specific environment and startup programs

# Add home bin
if [ -d "$HOME/bin" ]; then
    export PATH=$PATH:$HOME/bin
fi

# Add go bin directories
if [ -d "$HOME/go/bin" ]; then
    export PATH=$PATH:$HOME/go/bin
fi
if [ -d "/usr/local/go/bin" ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

# Add ~/.local/bin directory to pick up pipx installed Python things
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

# If git-prompt is installed, run that.
if [ -f ~/programs/git-prompt/git-prompt.sh ]; then
  . ~/programs/git-prompt/git-prompt.sh
fi

# Source completions
for fn in ~/completions/*.bash; do
    . ${fn}
done

# Add to man path
export MANPATH=$MANPATH:$HOME/man

export EDITOR=vim

alias dc='docker-compose'

# If pyenv is installed, init it
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"

  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

export WORKON_HOME=$HOME/venvs/
source $HOME/.local/bin/virtualenvwrapper.sh

# If cargo env is around, source that to pick up Rust things
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
