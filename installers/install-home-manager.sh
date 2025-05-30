#!/usr/bin/env zsh

DST=~/.config/home-manager
unlink $DST
mv $DST ~/.config/home-manager-pre-install
ln -s $(pwd)/home-manager $DST
