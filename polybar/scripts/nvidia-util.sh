#!/bin/sh
temp=$(echo $(nvidia-smi -q -d UTILIZATION -i 0 | cut -d"
" -f11 | cut -d":" -f2 | cut -d" " -f2)%
)

if [ "$temp" != "" ]; then
    echo "$temp"
else
    echo "None"
fi
