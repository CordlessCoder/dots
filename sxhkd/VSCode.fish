if xdotool search --class 'code' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser-window' | count
xdotool search --class 'code' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser-window' windowactivate
xdo show (xdotool search --name "Visual Studio Code\$" || echo "none")
else
code -r
end
