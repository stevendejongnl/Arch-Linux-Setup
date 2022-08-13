#!/bin/bash

DISPLAYPORT = 'DP-1'
HDMIONE = 'HDMI-1'
HDMITWO = 'HDMI-1-1'
if [[ $(xrandr -q | grep 'DP-2 connected') ]]; then
	DISPLAYPORT = 'DP-2'
fi

if [[ $(xrandr -q | grep 'HDMI-2 connected') ]]; then
	HDMIONE = 'HDMI-2'
fi

if [[ $(xrandr -q | grep 'HDMI-1-2 connected') ]]; then
	HDMITWO = 'HDMI-1-2'
fi

## Set gpu and monitor
xrandr --setprovideroutputsource 1 0

### Max card resolution (LG Monitor)
cvt 2048 864 60
xrandr --newmode "2048x864_60.00"  145.25  2048 2168 2376 2704  864 867 877 897 -hsync +vsync
xrandr --addmode $HDMITWO 2048x864_60.00

autorandr --load triple

sleep 3

bspc monitor $HDMITWO -d 1 2 3
bspc monitor $HDMIONE -d 4 5 6
bspc monitor $DISPLAYPORT -d 7 8 9

notify-send -i display "Display profile" "$(autorandr --current)"
