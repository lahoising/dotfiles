#!/usr/bin/env zsh

install() {
  SRC=$1
  DST=$2
  unlink $DST
  mv $DST ${DST}-pre-install
  ln -s $SRC $DST
  ls -l $DST
}
