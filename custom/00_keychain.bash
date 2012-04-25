#!/usr/bin/env bash

if [ "$(which keychain)" != "" ]; then
  keychain --timeout 360 ~/.ssh/id_rsa
  
  source ~/.keychain/$(hostname)-sh
fi;
