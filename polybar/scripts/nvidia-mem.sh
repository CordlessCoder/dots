#!/bin/sh
mem=$(cat /tmp/.nvidia_mem)

if [ "$mem" != "" ]; then
    echo "$mem"
else
    python ~/.config/polybar/scripts/nvidia-mem.py &
fi