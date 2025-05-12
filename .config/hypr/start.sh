#!/bin/bash
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=Unity

function is_bin_in_path {
  builtin type -P "$1" &> /dev/null
}

# swaybg -m fill -i ~/.config/hypr/catppuccin.png &
is_bin_in_path hyprpaper && hyprpaper &
is_bin_in_path kdeconnect-indicator && kdeconnect-indicator &
lxpolkit &
waybar &
# eww open bar &
# prime-offload
