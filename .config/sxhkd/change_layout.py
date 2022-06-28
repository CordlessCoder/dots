#!/usr/bin/env python
import os
import sys

layouts = ["us", "ru", "ua"]  # List of layouts to go through
disable_caps = True  # Whether to disable CapsLock


def layout_walk(current, direction):
    try:
        if direction != "last":
            return layouts[(layouts.index(current) + 1) % len(layouts)]
        else:
            return layouts[layouts.index(current) - 1]
    except ValueError:
        return layouts[0]


def set_layout(layout):
    os.system(
        f"setxkbmap{' -option caps:none' * disable_caps}{' -option caps:capslock' * abs(disable_caps-1)} -layout {layout}"
    )


try:
    arg = sys.argv[1]
    with open("/tmp/.current_layout", "w") as display:
        if arg not in ["next", "last"]:
            display.write(arg)
            set_layout(arg)
        else:
            current_layout = (
                os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1].strip()
            )
            if arg == "next":
                layout = str(layout_walk(current_layout, "next"))
            else:
                layout = str(layout_walk(current_layout, "last"))
            display.write(layout)
            set_layout(layout)
except IndexError:
    current_layout = os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1].strip()
    with open("/tmp/.current_layout", "w") as display:
        layout = str(layout_walk(current_layout, "next"))
        display.write(layout)
        set_layout(layout)
# os.system("polybar-msg action \#layout.next")
