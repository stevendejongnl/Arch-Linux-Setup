#! /bin/bash

source $HOME/.config/bspwm/get-monitors.sh

ACTIVETRAY=$(xprop -name "Polybar tray window" _NET_WM_PID | grep -o '[[:digit:]]*')

if [[ $ACTIVETRAY ]]; then
    kill $ACTIVETRAY
else
    MONITOR=$AOC_HDMI polybar tray 2>&1 | tee -a /tmp/polybar-tray.log & disown
fi
