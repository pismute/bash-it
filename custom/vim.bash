#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.

if [ ! -L ~/.vimrc ]; then
  if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak;
  fi;

  ln -s ${BASH}/custom/.vimrc ~/.vimrc
fi;

