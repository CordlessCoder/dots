#!/bin/sh
temp=$(echo $(nvidia-smi -q -d TEMPERATURE -i 0 | cut -d"
" -f11 | cut -d":" -f2 | cut -d" " -f2)°C
)

if [ "$temp" != "" ]; then
    echo "$temp"
else
    echo "None"
fi
