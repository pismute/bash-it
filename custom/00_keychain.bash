#!/usr/bin/env bash

UNAME=`uname`

if [[ "$UNAME" != "Darwin" && "$(which keychain)" != "" ]]; then

    keychain --timeout 720 ~/.ssh/id_rsa

    source ~/.keychain/$(hostname)-sh
fi;
