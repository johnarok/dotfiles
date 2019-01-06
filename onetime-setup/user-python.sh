#!/bin/bash
set -euxo
#source ~/progx/dotfiles/profile-scripts/bashrcinit.sh

export PYTHONUSERBASE=~/progx/python-tools
mkdir -p ~/progx/python-tools/
python3 -m pip install --user mdv
