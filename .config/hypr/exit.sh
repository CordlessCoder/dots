#!/bin/bash
~/.config/hypr/closeall.sh
hyprctl dispatch exit >> /tmp/hyprexitwithgrace.log 2>&1
