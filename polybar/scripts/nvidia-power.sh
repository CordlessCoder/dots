#!/bin/bash
if command -v nvidia-smi &> /dev/null
then
    while true
    power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits)W
    do echo "$power";
    sleep .5;
    done
else
    while true;
    do echo "";
    sleep 1000;
    done
fi
