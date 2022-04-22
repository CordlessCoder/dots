#!/bin/bash

if [ $(xdotool search --class 'chromium' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' | wc -l) -ge 1 ]
then 
	xdotool search --class 'chromium' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' windowactivate
	xdo show $(xdotool search --name " \- Chromium" || echo "none")
else
	chromium --class="Ungoogled-Chromium-Window" &>/dev/null &

fi
