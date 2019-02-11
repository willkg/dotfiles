# .bash_profile

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin

# If git-prompt is installed, run that.
if [ -f ~/programs/git-prompt/git-prompt.sh ]; then
  . ~/programs/git-prompt/git-prompt.sh
fi

export PATH
# export EDITOR="/usr/bin/emacs --no-window-system --quick"
# export EDITOR="/usr/bin/emacs --no-window-system"
export EDITOR=vim

alias dc='docker-compose'

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$HOME/.cargo/bin:$HOME/go/bin:$PYENV_ROOT/bin:$PATH"

export WORKON_HOME=$HOME/venvs/
source $HOME/.local/bin/virtualenvwrapper.sh

# If pyenv is installed, init it
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
