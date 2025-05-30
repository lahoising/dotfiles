#!/usr/bin/env zsh

SRC=$(pwd)/hypr
DST=~/.config/hypr

source $(pwd)/installers/install-dir.sh
install $SRC $DST
