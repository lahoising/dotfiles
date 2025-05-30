#!/usr/bin/env zsh

SRC=$(pwd)/waybar
DST=~/.config/waybar

source $(pwd)/installers/install-dir.sh
install $SRC $DST
