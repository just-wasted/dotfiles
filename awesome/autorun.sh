#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/bin/lxpolkit
# run nitrogen --restore
run picom -f
run conky -q
run numlockx
run volumeicon   
# run tint2
# run tint2 -c /home/wasted/.config/tint2/tray.tint2rc
run redshift-gtk
run clipmenud
