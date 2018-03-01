#!/bin/bash

# Install virtualenv-wrapper
pip install --user virtualenvwrapper

# Install pipenv
pip install --user pipenv

# Install pipsi
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

# Use pipsi to install other things
toinstall=( autopep8 aws bandit check-manifest docker-compose flake8 hashin piprot sphinx tox twine youtube-dl )
for pkg in "${toinstall[@]}"
do
    pipsi install "${pkg}"
done
