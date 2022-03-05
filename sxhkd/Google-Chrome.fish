if xdotool search --class 'google-chrome' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' | count
xdotool search --class 'google-chrome' getwindowpid %@ | uniq | xargs -I{} xdotool search --all --pid {} --role 'browser' windowactivate
xdo show (xdotool search --name "Google Chrome\$" || echo "none")
else
google-chrome-stable
end
