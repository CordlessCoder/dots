#!/bin/sh
mem=$(python ~/.config/polybar/scripts/nvidia-mem.py)

if [ "$mem" != "" ]; then
    echo "$mem"
else
    echo "NVIDIA GPU/PROPRIATARY DRIVERS NOT FOUND"
fi