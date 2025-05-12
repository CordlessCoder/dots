#!/usr/bin/sh
slurp -p | grim -g - - | convert - txt: | tail -n1 | cut -d " " -f 4 | wl-copy
