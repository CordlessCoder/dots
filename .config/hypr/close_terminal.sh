#!/bin/bash
clients=$(hyprctl clients -j)
addr=$(echo "$clients" | jq -r '.[] | select(.class == "popup-top-right") | .address')
for addr in $addr; do
	hyprctl dispatch closewindow "address:$addr" >/dev/null
done
