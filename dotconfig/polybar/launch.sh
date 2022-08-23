#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

LG_HDMI='HDMI-1-1'
AOC_HDMI='HDMI-1'
AOC_DP='DP-1'

if [[ $(xrandr -q | grep 'HDMI-1-2 connected') ]]; then
	LG_HDMI='HDMI-1-2'
fi
if [[ $(xrandr -q | grep 'HDMI-2-2 connected') ]]; then
	LG_HDMI='HDMI-2-2'
fi

if [[ $(xrandr -q | grep 'HDMI-2 connected') ]]; then
	AOC_HDMI='HDMI-2'
fi
if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
	AOC_HDMI='HDMI-A-0'
fi

if [[ $(xrandr -q | grep 'DisplayPort-0 connected') ]]; then
	AOC_DP='DisplayPort-0'
fi

MONITOR=$AOC_HDMI polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
MONITOR=$AOC_DP polybar secondary 2>&1 | tee -a /tmp/polybar-secondary.log & disown
MONITOR=$LG_HDMI polybar tertiary 2>&1 | tee -a /tmp/polybar-tertiary.log & disown
