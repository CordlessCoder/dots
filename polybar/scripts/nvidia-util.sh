#!/bin/bash
if command -v nvidia-smi &> /dev/null
then
    while true
    util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)%
    do echo "$util";
    sleep .5;
    done
else
    while true;
    do echo "";
    sleep 1000;
    done
fi
