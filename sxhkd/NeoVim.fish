#!/bin/fish

if xdotool search --class 'kitty' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --name ' \- NVIM' | count 2&>/dev/null
    xdotool search --class 'kitty' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --name ' \- NVIM' windowactivate
    xdo show (xdotool search --name " \- NVIM" || echo "none")
else
    kitty --name NeoVim -e "nvim" &
end
