#!/usr/bin/env python
import sys
import os

# POLYWORKS

# SETTINGS

active_text_color = "#EB6572"
active_bg = "#24283B"
active_underline = "#EB6572"

inactive_text_color = "#C0CAF5"
inactive_bg = ""
inactive_underline = "#C0CAF5"

separator = " "
show = "window_classname"  # options: window_title, window_class, window_classname
forbidden_classes = "Polybar Conky Gmrun Pavucontrol"
empty_desktop_message = "Desktop"

char_limit = 10
max_windows = 12
char_case = "upper"  # normal, upper, lower
add_spaces = "true"
resize_increment = 16
resize_offset = resize_increment / 2


# WINDOW LIST SETUP


active_left = "%{F" + active_text_color + "}"
active_right = "%{F-}"
inactive_left = "%{F" + inactive_text_color + "}"
inactive_right = "%{F-}"
separator = "%{F" + inactive_text_color + "}" + separator + "%{F-}"


def printf(text):
    print(text, end="")


def get_active_workspace():
    workspaces = os.popen("wmctrl -d")
    while True:
        line = workspaces.readline()
        if line[3] == "*":
            return line[35:]


def wid_to_name(wid, wlist):
    name = os.popen(f"xprop -id {wid} WM_CLASS", "r").read().split('"')[1]
    return name.upper()


def regen(windows, focused):
    lookup = os.popen("wmctrl -lx").readlines()
    wlist = {}
    for line in lookup:
        wlist[line[:2] + line[3:10]] = line.split(" ")[3].split(".")[0].upper()
    for i, window in enumerate(windows[:max_windows]):
        i != 0 and printf(separator)
        printf("%{A1:$on_click raise_or_minimize " + window + ":}")
        printf("%{A2:$on_click close " + window + ":}")
        printf("%{A3:$on_click slop_resize " + window + ":}")
        printf("%{A4:$on_click increment_size " + window + ":}")
        printf("%{A5:$on_click decrement_size " + window + ":}")
        if window == focused:
            printf(active_left + wlist[window] + active_right)
        else:
            printf(inactive_left + wlist[window] + inactive_right)
        printf("%{A}%{A}%{A}%{A}%{A}")
    if len(windows) > max_windows:
        printf(f"+{len(windows)-max_windows}")
    elif len(windows) == 0:
        printf(empty_desktop_message)


def main():
    # monitor = sys.argv[1]
    if len(sys.argv) <= 2:
        command = os.popen("xprop -root -spy _NET_CLIENT_LIST _NET_ACTIVE_WINDOW")
        windows = []
        focused = ""
        while True:
            update = command.readline().replace("\n", "")
            if update.startswith("_NET_CLIENT_LIST"):
                windows = update.split("#")[-1][1:].split(", ")
            else:
                focused = update.split("#")[1].strip()
            regen(windows, focused)
            print()


if __name__ == "__main__":
    main()
