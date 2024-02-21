#!/bin/bash
clients=$(hyprctl clients -j)
addr=$(echo "$clients" | jq -r '.[] | select(.class == "popup-top-right") | .address')
echo $addr
if [ -z "$addr" ]; then
	# If there's no popup running
	kitty --class="popup-top-right" &
else
	# There is a popup running
	on_scratch=$(echo "$clients" | jq -r '.[] | select(.class == "popup-top-right") | .workspace | select(.name == "special:scratchpad")')
	# hyprctl dispatch movetoworkspacesilent "special:scratchpad,address:$addr"
	if [ -z "$on_scratch" ]; then
		# The popup is visible
		for addr in $addr; do
			hyprctl dispatch movetoworkspacesilent "special:scratchpad,address:$addr" >/dev/null
		done
	else
		# The popup is invisible
		for addr in $addr; do
			hyprctl dispatch movetoworkspacesilent "e+0,address:$addr" >/dev/null
		done
	fi
fi
