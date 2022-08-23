#!/bin/bash

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

## Set gpu and monitor
xrandr --setprovideroutputsource 1 0

### Max card resolution (LG Monitor)
cvt 2048 864 60
xrandr --newmode "2048x864_60.00"  145.25  2048 2168 2376 2704  864 867 877 897 -hsync +vsync
xrandr --addmode $LG_HDMI 2048x864_60.00

autorandr --load $LG_HDMI

# xrandr --output $HDMIONE --mode 1920x1080 --rate 144
# xrandr --output $DISPLAYPORT --mode 1920x1080 --rate 144

sleep 3

bspc monitor $LG_HDMI -d 1 2 3
bspc monitor $AOC_HDMI -d 4 5 6
bspc monitor $AOC_DP -d 7 8 9
