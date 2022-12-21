export MANPATH=$MANPATH:$HOME/man

if [ -d "${HOME}/.local.bin" ]; then
    export PATH="$PATH:/home/willkg/.local/bin"
fi
