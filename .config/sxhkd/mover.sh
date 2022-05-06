#!/bin/sh
wid="$(xdo id)"
bspc node "$wid" -g hidden=off &
bspc node "$wid" -d focused --follow
xdo hide "$wid" &
pos="$(slop -b 2 -c 0.75,0.8,0.96,1 -f 0,%x,%y,%w,%h)"
xdo show "$wid"
bspc node "$wid" -t floating
wmctrl -ir "$wid" -e "$pos"
xdo activate "$wid"
