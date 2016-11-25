#!/bin/sh
win_id=$(printf '%d' $(wmctrl -lx | awk '/tmux/ { print $1 }'))
xdotool windowactivate --sync $win_id key Control_R+a 1

