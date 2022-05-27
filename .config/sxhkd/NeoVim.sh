#!/bin/bash

if [ $(xdotool search --onlyvisible --name ' \- NVIM' | wc -l) -ge 1 ]
then
	xdo show $(xdotool search --name " \- NVIM" || echo "none")
	bspc node $(xdotool search --name " \- NVIM" || echo "none") -g hidden=off &
	xdotool search --onlyvisible --name ' \- NVIM' windowactivate
else
	neovide
fi
