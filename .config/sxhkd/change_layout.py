#!/usr/bin/env python
import os
import sys

layouts = ["us", "colemak", "ua"]  # List of layouts to go through
capslock_behaviour = (
    2  # 0 to not change capslock behavour, 1 to disable it and 2 to use it as a backspace
)


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
        f"setxkbmap {['-option caps:capslock', '-option caps:none', '-option caps:backspace'][capslock_behaviour]} -layout {layout}"
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
