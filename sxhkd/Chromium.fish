#!/bin/fish

if xdotool search --class 'chromium' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' | count 2&>/dev/null
    xdotool search --class 'chromium' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' windowactivate
    xdo show (xdotool search --name " \- Chromium" || echo "none")
else
    chromium --class="Ungoogled-Chromium-Window"
end
