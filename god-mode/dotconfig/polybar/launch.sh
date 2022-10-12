#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=$AOC_HDMI polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
MONITOR=$AOC_DP polybar secondary 2>&1 | tee -a /tmp/polybar-secondary.log & disown
MONITOR=$LG_HDMI polybar tertiary 2>&1 | tee -a /tmp/polybar-tertiary.log & disown
