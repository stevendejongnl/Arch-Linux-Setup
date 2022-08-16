#! /bin/sh

# The bspc rule -a command only uses XDG class names, which can be easily found out by using xprop:
# xprop | grep WM_CLASS

# Rules explained
# -o|--one-shot [Run rule once]

# States explained
# tiled
#   Its size and position are determined by the window tree.
#
# pseudo_tiled
#   A tiled window that automatically shrinks but doesn’t stretch beyond its floating size.
#
# floating
#   Can be moved/resized freely. Although it doesn’t use any tiling space, it is still part of the window tree.
#
# fullscreen
#   Fills its monitor rectangle and has no borders.

bspc config ignore_ewmh_focus true

# https://github.com/phenax/bsp-layout
bsp-layout set even 1
bsp-layout set even 2
bsp-layout set even 3


bspc rule -a whatsapp-nativefier-d40211 follow=off hidden
bspc rule -a TelegramDesktop follow=off hidden
bspc rule -a Timer-for-harvest follow=off state=floating
bspc rule -a Pavucontrol follow=off state=floating
bspc rule -a Blueman-manager follow=off state=floating
