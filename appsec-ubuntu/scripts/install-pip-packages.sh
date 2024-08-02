#!/bin/bash

# pipenv
$HOME/.local/bin/pip install pipenv

# poetry
cd $HOME/tmp
sudo curl -sSL https://install.python-poetry.org | python3 -

# flask app packages
$HOME/.local/bin/pip install -r /scripts/app/requirements.txt

