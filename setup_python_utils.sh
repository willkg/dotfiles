#!/bin/bash

# FIXME: install pyenv

# Install virtualenv-wrapper
pip install --user virtualenvwrapper

# Install pipx
pip install --user pipx
pipx ensurepath

# Use pipx to install other things
TOINSTALL=(
    autopep8
    aws
    bandit
    check-manifest
    docker-compose
    flake8
    hashin
    piprot
    sphinx
    tox
    twine
    youtube-dl
)
for pkg in "${TOINSTALL[@]}"
do
    pipx install "${pkg}"
done

