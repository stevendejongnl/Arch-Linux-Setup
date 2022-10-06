#! /bin/bash

LG_HDMI='HDMI-1-1'
AOC_HDMI='HDMI-1'
AOC_DP='DP-1'

if [[ $(xrandr -q | grep 'HDMI-1-2 connected') ]]; then
	LG_HDMI='HDMI-1-2'
fi
if [[ $(xrandr -q | grep 'HDMI-2-1 connected') ]]; then
	LG_HDMI='HDMI-2-1'
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
if [[ $(xrandr -q | grep 'HDMI-A-1 connected') ]]; then
	AOC_HDMI='HDMI-A-1'
fi

if [[ $(xrandr -q | grep 'DP-2 connected') ]]; then
	AOC_DP='DP-2'
fi
if [[ $(xrandr -q | grep 'DisplayPort-0 connected') ]]; then
	AOC_DP='DisplayPort-0'
fi
if [[ $(xrandr -q | grep 'DisplayPort-1 connected') ]]; then
	AOC_DP='DisplayPort-1'
fi

export LG_HDMI
export AOC_HDMI
export AOC_DP
