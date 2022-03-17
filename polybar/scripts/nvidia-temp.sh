#!/bin/sh
temp=$(cat /tmp/.nvidia_temp)

if [ "$temp" != "" ]; then
    echo "$temp"
else
    python ~/.config/polybar/scripts/nvidia-temp.py &
fi