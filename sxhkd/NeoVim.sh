#!/bin/bash

if [ $(xdotool search --class 'kitty' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --name ' \- NVIM' | wc -l) -ge 1 ]
then
	xdo show $(xdotool search --name " \- NVIM" || echo "none")
	bspc node $(xdotool search --name " \- NVIM" || echo "none") -g hidden=off &
	xdotool search --class 'kitty' getwindowpid | uniq | xargs -I{} xdotool search --all --pid {} --name ' \- NVIM' windowactivate
else
	kitty --name NeoVim -e "nvim" &>/dev/null &
fi
