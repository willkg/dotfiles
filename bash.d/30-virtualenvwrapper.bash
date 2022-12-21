# virtualenvwrapper -- installed with pipx
VEW="${HOME}/.pyenv/versions/3.10.9/bin/virtualenvwrapper.sh"
if [ -f "${VEW}" ]; then
    export WORKON_HOME=${HOME}/venvs/
    . "${VEW}"
fi
