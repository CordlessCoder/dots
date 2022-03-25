#!/bin/sh
mem=$(echo $(nvidia-smi -q -d MEMORY -i 0 | cut -d"
" -f13 | cut -d":" -f2 | cut -d" " -f2) \* 100 / $(nvidia-smi -q -d MEMORY -i 0 | cut -d"
" -f11 | cut -d":" -f2 | cut -d" " -f2) | bc
)%

if [ "$mem" != "" ]; then
    echo "$mem"
else
    echo "None"
fi
