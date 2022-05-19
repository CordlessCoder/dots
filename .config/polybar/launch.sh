#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
if type "xrandr" >/dev/null; then
	for m in $(polybar -m | cut -d':' -f1); do
		pos=$(expr $(echo $(xrandr --listactivemonitors | grep $m | cut -d"/" -f1 | cut -d" " -f4) \* .99 | bc | cut -d"." -f1) + $(xrandr --listactivemonitors | grep $m | cut -d"/" -f3 | cut -d"+" -f2))
		posrel=$(echo $(xrandr --listactivemonitors | grep $m | cut -d"/" -f1 | cut -d" " -f4) \* .98 | bc | cut -d"." -f1)
		MONITOR=$m POSITION=$pos POSREL=$posrel polybar --reload main_bar &
	done
else
	polybar --reload main_bar &
fi
echo "Bars launched..."
sleep 1
xdo lower -N "Polybar"
xdo above -N "Polybar" -t $(xdo id -N Bspwm -n root)
