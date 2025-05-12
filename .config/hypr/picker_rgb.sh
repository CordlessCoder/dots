#!/usr/bin/sh
slurp -p | grim -g - - | convert - txt: | tail -n1 | cut -d " " -f 2 | cut -c 2- | head -c -2 | wl-copy
