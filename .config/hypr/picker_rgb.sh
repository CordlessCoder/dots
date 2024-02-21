slurp -p | grim -g - - | convert - txt: | awk 'NR==2 {{ print $2 }}' | wl-copy
