#!/bin/bash

if [ $(xdotool search --class 'firefoxdeveloperedition' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' | wc -l) -ge 1 ]
then 
	xdo show $(xdotool search --name "Firefox Developer Edition" || echo "none")
	bspc node $(xdotool search --name "Firefox Developer Edition" || echo "none") -g hidden=off &
	xdotool search --class 'firefoxdeveloperedition' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' windowactivate
else
	firefox-developer-edition &>/dev/null &
fi
