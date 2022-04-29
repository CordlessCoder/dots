#!/bin/bash
if command -v nvidia-smi &> /dev/null
then
    while true
    mem=$(nvidia-smi --query-gpu=utilization.memory --format=csv,noheader,nounits)%;
    do echo "$mem";
    sleep .5;
    done
else
    while true;
    do echo "";
    sleep 1000;
    done
fi
