#!/bin/bash
./closeall.sh
hyprctl dispatch exit >>/tmp/hypr/hyprexitwithgrace.log 2>&1
