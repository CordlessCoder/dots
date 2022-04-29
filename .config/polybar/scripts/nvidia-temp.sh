#!/bin/bash
if command -v nvidia-smi &> /dev/null
then
    while true
    temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)°C
    do echo "$temp";
    sleep 1;
    done
else
    while true;
    do echo "";
    sleep 1000;
    done
fi
