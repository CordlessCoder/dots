#!/bin/sh
layout=$(cat /tmp/.current_layout)

if [ "$layout" != "" ]; then
    if [ "$layout" != "cat: /tmp/.current_layout: No such file or directory" ]; then
        echo " $layout "
    else
        echo " us "
    fi
else
    echo " us "
fi
