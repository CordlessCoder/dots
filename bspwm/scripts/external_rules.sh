#! /bin/bash
# ~/.config/bspwm/scripts/external_rules.sh

window_id="$1"
window_class="$2"
window_instance="$3"
consequences="$4"

wm_name=$(xprop -id "$window_id" WM_NAME | cut -d\" -f2)

case "$wm_name" in
  "Zotero Preferences" | "ZotFile Preferences" | "Picture-in-Picture" | "Software Update" | "About Mozilla Firefox")
   echo "state=floating"
   echo "border=off"
   echo "focus=on"
    ;;
  *)
    ;;
esac
