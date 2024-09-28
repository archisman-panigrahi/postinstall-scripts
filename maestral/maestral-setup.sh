#!/bin/bash

sudo apt install python3-venv
python3 -m venv maestral-venv
source maestral-venv/bin/activate
python3 -m pip install --upgrade maestral
python3 -m pip install --upgrade 'maestral[gui]'

mkdir -p $HOME/bin
mkdir -p $HOME/.local/share/applications
mkdir -p $HOME/.local/share/icons/hicolor/512x512/apps

cp maestral.sh $HOME/bin/
cp maestral-run $HOME/bin/
cp maestral.desktop $HOME/.local/share/applications/
cp maestral.png $HOME/.local/share/icons/hicolor/512x512/apps/