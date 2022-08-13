#!/bin/bash

if [[ $(xrandr -q | grep 'HDMI-1-2 connected') ]]; then
	## Set gpu and monitor
	xrandr --setprovideroutputsource 1 0

	### Max card resolution (LG Monitor)
	cvt 2048 864 60
	xrandr --newmode "2048x864_60.00"  145.25  2048 2168 2376 2704  864 867 877 897 -hsync +vsync
	xrandr --addmode HDMI-1-2 2048x864_60.00

	autorandr --load triple
	
	sleep 3

	bspc monitor HDMI-1-2 -d 1 2 3
	bspc monitor HDMI-1 -d 4 5 6
	bspc monitor DP-1 -d 7 8 9
else
	autorandr --load double
	
	sleep 3

	bspc monitor HDMI-1 -d 1 2 3 4 5
	bspc monitor DP-1 -d 6 7 8 9
fi

notify-send -i display "Display profile" "$(autorandr --current)"
