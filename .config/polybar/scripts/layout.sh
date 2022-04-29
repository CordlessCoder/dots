#!/bin/sh
layout=$(cat /tmp/.current_layout)

if [ "$layout" != "" ]; then
    if [ "$layout" != "cat: /tmp/.current_layout: No such file or directory" ]; then
        if [ "$layout" == "us" ]; 
        then
            echo "%{F#C0CAF5} us "
        else
            echo " $layout "
        fi
    else
        echo "%{F#C0CAF5} us "
    fi
else
    echo " us "
fi
