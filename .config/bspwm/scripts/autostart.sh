#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "run_bg program" to run it with low priority, only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of BSPWM[Binary Space Partitioning Window Manager]
# If you would like to run a command *once* on login,
# you can use ~/.xprofile

# ##############################################################################
# #                                  FUNCTIONS                                 # 
# ##############################################################################
function run_bg {
    if ! pgrep $1 > /dev/null ;
    then
        nice -n 19 $@ &
    fi
}
function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@ &
    fi
}


# Parse colors from "~/.Xresources"
xrdb -override "${HOME}/.Xresources" &
feh --bg-fill ~/.config/bspwm/wallpaper.png &

xrdb_query()
{
    [ -n "$XRDB_QUERY" ] || XRDB_QUERY="$(xrdb -query)"

    echo "$XRDB_QUERY" | while IFS=';' read -r STRING; do
        [ "${1}" = "${STRING%%\	*}" ] || continue
        echo "${STRING##*\	}"
        break
    done
}
xsetroot -cursor_name left_ptr

# Desktop effects
run picom
setxkbmap -option caps:none -layout us

#start the Dunst daemon
run_bg dunst

#start Conky
run_bg conky -c ~/.conkyrc
#start GLava
if ! pgrep glava > /dev/null ;
    then
         python ~/.config/glava/Player_Colorizer.py | nice -n 19 glava -i &
    fi
# ##############################################################################
# #                             AUTOSTART POLYBAR(s)                           #
# ##############################################################################


pkill -f '^polybar'
$HOME/.config/polybar/launch.sh

sleep .1
bspc config ignore_ewmh_struts true
sh $HOME/.config/polybar/tinybar.sh &
sleep .2
xdo lower -N "Polybar"
xdo above -N "Polybar" -t $(xdo id -N Bspwm -n root)
xdo raise -a "Polybar tray window"
#xdo raise $(xdotool search --onlyvisible --name "^polybar-resources_*")
xdo raise -a "Polybar tray window"
xdo raise -a "Polybar tray window"
xdo raise -a "Polybar tray window"
xdo hide -a "Polybar tray window"
sleep .1
xdo hide $(xdotool search --onlyvisible --name "^polybar-tray_" || echo "none")
#xdo raise $(xdotool search --onlyvisible --name "^polybar-resources_*")
#xdo raise $(xdotool search --onlyvisible --name "^polybar-resources_*")
#xdo hide $(xdotool search --onlyvisible --name "^polybar-resources_*" || echo "none")

# lock screen
xset s 360
xss-lock -n $HOME/.config/sxhkd/lock.sh
xdo raise -a "Polybar tray window"

xdo lower -r $(xdotool search --class glava)
#xdotool search --class 'splash' set_window --overrideredirect 1 windowunmap windowmap


