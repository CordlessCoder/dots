#!/usr/bin/env python
import os
import sys

layouts = ("us", "us -variant colemak_dh", "ru", "ua")  # List of layouts to go through
capslock_behaviour = 2  # 0 to not change capslock behavour, 1 to disable it and 2 to use it as a backspace

extra_commands = ["xmodmap -e 'keycode 66 = BackSpace'"]


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
        f"setxkbmap {('-option caps:capslock', '-option caps:none', '-option caps:backspace')[capslock_behaviour]} -layout {layout}"
    )


try:
    arg = sys.argv[1]
    with open("/tmp/.current_layout", "w") as display:
        if arg not in ["next", "last"]:
            display.write(arg)
            set_layout(arg)
        else:
            layout_data = os.popen("setxkbmap -query", mode="r").read().split("\n")
            current_layout = layout_data[2].split()[1].strip()
            variant = "" if layout_data[3][0] != "v" else (" -variant " + layout_data[3].split()[1].strip())
            if arg == "next":
                layout = str(layout_walk(current_layout + variant, "next"))
            else:
                layout = str(layout_walk(current_layout + variant, "last"))
            display.write(layout.replace(" -variant", ""))
            set_layout(layout)
except IndexError:
    current_layout = os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1].strip()
    with open("/tmp/.current_layout", "w") as display:
        layout_data = os.popen("setxkbmap -query", mode="r").read().split("\n")
        current_layout = layout_data[2].split()[1].strip()
        variant = "" if layout_data[3][0] != "v" else (" -variant " + layout_data[3].split()[1].strip())
        layout = str(layout_walk(current_layout + variant, "next"))
        display.write(layout.replace(" -variant", ""))
        set_layout(layout)
for command in extra_commands:
    os.system(command)
# os.system("polybar-msg action \#layout.next")
