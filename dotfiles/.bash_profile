# .bash_profile

# User specific environment and startup programs

# FIXME(willkg): somehow ~/.cargo/bin and ~/.local/bin is already in the path at
# this point.
# export PATH="$HOME/.cargo/bin:$HOME/go/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# If git-prompt is installed, run that.
if [ -f ~/programs/git-prompt/git-prompt.sh ]; then
  . ~/programs/git-prompt/git-prompt.sh
fi

export EDITOR=vim

alias dc='docker-compose'

# If pyenv is installed, init it
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export WORKON_HOME=$HOME/venvs/
source $HOME/.local/bin/virtualenvwrapper.sh
