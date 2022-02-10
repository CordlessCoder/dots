#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# If you would like to run a command *once* on login,
# you can use ~/.xprofile

function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@ &
    fi
}

# Music
# run mpd
# (Alternatively, enable the mpd service so mpd runs on login)

# Emacs daemon
#run emacs --daemon

# Load terminal colorscheme and settings
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Urxvt daemon
# run urxvtd -q -o -f

# Mpv input file
# if [ ! -e /tmp/mpv.fifo ]; then
#     mkfifo /tmp/mpv.fifo
# fi

# Desktop effects
pkill picom
picom --experimental-backends &

# redshift
#pkill -f '^redshift'
#run redshift -l -33.96:18.47 -b 1.0:0.5

# sxhkd
#run sxhkd
pkill urxvtd
run urxvtd
# dunst
pkill dunst
run dunst

# glava
#pkill -f 'GLava^'
#$HOME/startup/glava.sh

# polybars
pkill -f '^polybar'
$HOME/.config/polybar/launch.sh

run xdo lower -N "Polybar"
run xdo above -N "Polybar" -t $(xdo id -N Bspwm -n root)

# lock screen
run xset s 360
run xss-lock -n $HOME/.config/sxhkd/lock.sh



xinput set-prop 'Glorious Model O Wireless' 'libinput Accel Speed' -.7
xinput set-prop 'Glorious Model D' 'libinput Accel Speed' -.7
sleep 5
xinput set-prop 'Glorious Model D' 'libinput Accel Speed' -.7
xinput set-prop 'Glorious Model O Wireless' 'libinput Accel Speed' -.7
sleep 5
xinput set-prop 'Glorious Model D' 'libinput Accel Speed' -.7
xinput set-prop 'Glorious Model O Wireless' 'libinput Accel Speed' -.7
# Enable numlock on login
# Required numlockx to be installed
# run numlockx

# Network manager tray icon
# run nm-applet

# Kill redshift processes
# pkill redshift

# Wallpaper
# (Already set to run in rc.lua)
#run wallpaper

#run float_focus
run xdo lower -N "Polybar"
run xdo above -N "Polybar" -t $(xdo id -N Bspwm -n root)
