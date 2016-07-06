# .bash_profile

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

# If git-prompt is installed, run that.
if [ -f ~/programs/git-prompt/git-prompt.sh ]; then
  . ~/programs/git-prompt/git-prompt.sh
fi

export PATH
export EDITOR="/usr/bin/emacs --no-window-system --quick"
