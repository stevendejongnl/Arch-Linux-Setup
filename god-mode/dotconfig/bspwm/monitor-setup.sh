#!/bin/bash

## Set gpu and monitor
xrandr --setprovideroutputsource 1 0

### Max card resolution (LG Monitor)
cvt 2048 864 60
xrandr --newmode "2048x864_60.00"  145.25  2048 2168 2376 2704  864 867 877 897 -hsync +vsync
xrandr --addmode $LG_HDMI 2048x864_60.00

autorandr --load $LG_HDMI

sleep 3

bspc monitor $LG_HDMI -d 1 2 3
bspc monitor $AOC_HDMI -d 4 5 6
bspc monitor $AOC_DP -d 7 8 9
