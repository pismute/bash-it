#!/usr/bin/env bash
#

function bash_it_a_day(){
  local today=`date +%Y%m%d`
  local file="/tmp/bash_it_a_day_$USER"
  local truncated=""

  if [ -f $file ]; then
    local uname=`uname`

    [ $uname = "Linux" ] && truncated=`date +%Y%m%d --reference=$file`

    [ $uname = "Darwin" ] && truncated=`stat -t %Y%m%d -f %Sm $file`

  fi

  if [ "$truncated" != "$today" ]; then
    cd $BASH_IT

    local git_pid=`ps -U $USER | grep git | grep -v grep  | awk '{print $1}' | xargs`

    if [ "$git_pid" = "" ]; then
      git checkout mine
      git fetch origin
      git merge origin/mine
    fi

    > $file #truncate file

    cd ~
  fi

}

bash_it_a_day
