#!/bin/sh
temp=$(python ~/.config/polybar/scripts/nvidia-temp.py)

if [ "$temp" != "" ]; then
    echo "$temp"
else
    echo "NVIDIA GPU/PROPRIATARY DRIVERS NOT FOUND"
fi