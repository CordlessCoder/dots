#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main_bar &
  done
else
  polybar --reload main_bar &
fi
echo "Bars launched..."
sleep 1
xdo lower -N "Polybar"
xdo above -N "Polybar" -t $(xdo id -N Bspwm -n root)

