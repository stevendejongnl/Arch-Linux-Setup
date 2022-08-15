#! /bin/sh

# The bspc rule -a command only uses XDG class names, which can be easily found out by using xprop:
# xprop | grep WM_CLASS

bspc config ignore_ewmh_focus true

# https://github.com/phenax/bsp-layout
bsp-layout set even 1
bsp-layout set even 2
bsp-layout set even 3

# bspc desktop -f ^1

# bspc rule -a whatsapp-nativefier-d40211 desktop=^1 follow=off
# bspc rule -a TelegramDesktop desktop=^1 follow=off

bspc desktop -f ^4
