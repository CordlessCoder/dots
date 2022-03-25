#!/bin/bash

cmd="bash get_status.sh $1"

#zscroll -l 110 \
#    --scroll-padding "$(printf ' %.0s' {1..8})" \
#    -d 4 \
#    -M "$cmd icon" \
#    -m "none"       "-b ''" \
#    -m "browser"    "-b ' '" \
#    -m "netflix"    "-b 'ﱄ '" \
#    -m "youtube"    "-b '%{F#EB6572} %{F-}'" \
#    -m "prime"      "-b ' '" \
#    -m "spotify"    "-b ' '" \
#    -m "vlc"        "-b '嗢 '" \
#    -m "mpv"        "-b ' '" \
#    -m "corridor"   "-b ' '" \
#    -U 3 -u t "$cmd" &
cd ~/.config/polybar/scripts
while true;
do echo $($cmd);
sleep 3;
polybar-msg action \#mpris-play-pause.next 1>/dev/null 2>&1;
done
