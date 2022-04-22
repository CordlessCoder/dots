#!/usr/bin/env python
import os
import sys

layouts = ["us", "ru", "ua"]


def layout_walk(current, direction):
    if direction != "last":
        return layouts[(layouts.index(current) + 1) % len(layouts)]
    else:
        return layouts[layouts.index(current) - 1]


try:
    arg = sys.argv[1]
    with open("/tmp/.current_layout", "w") as display:
        if arg not in ["next", "last"]:
            display.write(arg)
            os.system(f"setxkbmap -layout {arg}")
        else:
            current_layout = (
                os.popen("setxkbmap -query", mode="r")
                .read()
                .split("\n")[2]
                .split()[1]
                .strip()
            )
            if arg == "next":
                layout = str(layout_walk(current_layout, "next"))
            else:
                layout = str(layout_walk(current_layout, "last"))
            display.write(layout)
            os.system(f"setxkbmap -layout {layout}")
except IndexError:
    current_layout = (
        os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1].strip()
    )
    with open("/tmp/..current_layout", "w") as display:
        layout = str(layout_walk(current_layout, "next"))
        display.write(layout)
        os.system(f"setxkbmap -layout {layout}")
os.system("polybar-msg action \#layout.next")
