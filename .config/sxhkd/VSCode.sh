#!/bin/bash

if [ $(xdotool search --class 'code' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser-window' | wc -l) -ge 1 ]
then 
	xdotool search --class 'code' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser-window' windowactivate
	xdo show $(xdotool search --name "Visual Studio Code\$" || echo "none")
else
	code -r &>/dev/null &
fi
