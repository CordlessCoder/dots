#!/usr/bin/env python
import sys
import os

# import timeit

# POLYWORKS

# SETTINGS

active_text_color = "#EB6572"
active_bg = "#24283B"
active_underline = "#EB6572"

inactive_text_color = "#C0CAF5"
inactive_bg = ""
inactive_underline = "#C0CAF5"

separator = ""
show = "window_classname"  # options: window_title, window_class, window_classname
forbidden_classes = "Polybar Conky Gmrun Pavucontrol".upper().split(" ")
show_unpopulated_desktops = False

char_limit = 10
max_windows = 5
add_spaces = "true"
resize_increment = 16
resize_offset = resize_increment / 2


# WINDOW LIST SETUP


active_left = "%{F" + active_text_color + "}"
active_right = "%{F-}"
inactive_left = "%{F" + inactive_text_color + "}"
inactive_right = "%{F-}"
separator = "%{F" + inactive_text_color + "}" + separator + "%{F-}"

wps_active_left = "%{F" + inactive_text_color + "}%{+u}%{u" + inactive_underline + "}"

wps_active_right = "%{u}%{F-}"
wps_inactive_left = "%{F" + inactive_text_color + "}"
wps_inactive_right = "%{F-}"

if active_underline is not None:
    active_left = active_left + "%{+u}%{u" + active_underline + "}"
    active_right = "%{-u}" + active_right


if inactive_underline is not None:
    inactive_left += "%{+u}%{u" + inactive_underline + "}"
    inactive_right = "%{-u}" + inactive_right


active_left += "%{B" + active_bg + "}"
active_right = "%{B-}" + active_right


on_click = " ".join(sys.argv[:2])
monitor = sys.argv[1]


printf = sys.stdout.write


def get_active_wid():
    wid = os.popen("xprop -root _NET_ACTIVE_WINDOW").read().split("#")[1].strip()
    while len(wid) < 9:
        wid = "0x0" + wid[2:]
    return wid


def get_active_workspace():
    workspaces = os.popen("wmctrl -d")
    while True:
        line = workspaces.readline()
        if line[3] == "*":
            return " ".join(line.split(" ")[12:])[:-1]


def get_workspaces(monitor=None):
    if monitor is None:
        wml = os.popen("wmctrl -d").readlines()
        workspaces = [" ".join(line.split(" ")[12:])[:-1] for line in wml]
        active_workspace = 0
        for line in wml:
            if line[3] == "*":
                active_workspace = int(line.split(" ")[0])
                break
        return workspaces, active_workspace
    else:
        workspaces = os.popen(f"bspc query -m {monitor} -D --names").readlines()
        workspaces = [workspace[:-1] for workspace in workspaces]
        return workspaces


def regen(windows, focused):
    lookup = os.popen("wmctrl -lx 2> /dev/null").readlines()
    wlist = {}
    # try:
    for line in lookup:
        wlist[line[:2] + line[3:10]] = (
            line.split(" ")[3].split(".")[0].upper(),
            int(line.split(" ")[2]),
        )
    workspaces, active_workspace = get_workspaces()
    if len(windows) == 1 and windows[0] == "":
        for i, workspace in enumerate(get_workspaces(monitor)):
            i != 0 and printf(separator)
            if workspace == workspaces[active_workspace]:
                printf(wps_active_left + " " + workspace)
            else:
                printf(
                    "%{A1:" + on_click + " switch_workspace " + workspace + ":}"
                    "%{A2:"
                    + on_click
                    + " swap_workspace "
                    + workspace
                    + ":}"
                    + wps_active_right
                    + active_right
                    + " "
                    + workspace
                )
            printf(" " + "%{A}%{A}")
        return
    window_workspace_pairs = {}
    for workspace in workspaces:
        window_workspace_pairs[workspace] = []
    for window in windows:
        try:
            window_workspace_pairs[workspaces[wlist[window][1]]].append(window)
        except KeyError:
            pass
    i = 0
    for workspace in get_workspaces(monitor):
        if len(window_workspace_pairs[workspace]) == show_unpopulated_desktops - 1:
            continue
        i != 0 and printf(separator)
        i += 1
        if workspace == workspaces[active_workspace]:
            printf(wps_active_left + " " + workspace)
        else:
            printf(
                "%{A1:" + on_click + " switch_workspace " + workspace + ":}"
                "%{A2:"
                + on_click
                + " swap_workspace "
                + workspace
                + ":}"
                + wps_active_right
                + active_right
                + " "
                + workspace
            )
        if len(window_workspace_pairs[workspace]) >= 1:
            printf(":" + "%{A}%{A}")
        else:
            printf(" " + "%{A}%{A}")
        for wid in window_workspace_pairs[workspace][:max_windows]:
            if wlist[wid][0] in forbidden_classes:
                continue
            window = wlist[wid][0][:char_limit]
            printf(
                "%{A1:"
                + on_click
                + " raise_or_minimize "
                + wid
                + ":}%{A2:"
                + on_click
                + " close "
                + wid
                + ":}%{A3:"
                + on_click
                + " slop_resize "
                + wid
                + ":}%{A4:"
                + on_click
                + " increment_size "
                + wid
                + ":}%{A5:"
                + on_click
                + " decrement_size "
                + wid
                + ":}"
            )
            if wid == focused:
                printf(active_left + " " + window + " " + active_right)
            else:
                printf(inactive_left + " " + window + " " + inactive_right)
            printf("%{A}%{A}%{A}%{A}%{A}")
        if len(window_workspace_pairs[workspace]) > max_windows:
            printf(f"+{len(window_workspace_pairs[workspace])-max_windows}")
    # except KeyError:
    # pass


def main():
    if len(sys.argv) <= 2:
        command = os.popen("xprop -root -spy _NET_CLIENT_LIST _NET_ACTIVE_WINDOW")
        windows = ()
        focused = ""
        while True:
            update = command.readline().replace("\n", "")
            if "not found." in update:
                continue
            if update.startswith("_NET_CLIENT_LIST"):
                windows = ()
                windowlist = update.split("#")[-1][1:].split(", ")
                for window in windowlist:
                    while len(window) < 9:
                        window = "0x0" + window[2:]
                    windows = (*windows, window)
            elif update.startswith("_NET_ACTIVE_WINDOW"):
                focused = update.split("#")[1].strip()
            else:
                continue
            regen(windows, focused)
            printf("\n")
            sys.stdout.flush()
            # break
    else:
        exec(sys.argv[2] + "(" + "'" + sys.argv[3] + "')")


def slop_resize(window):
    os.system(
        f"""bash -c 'bspc node "{window}" -g hidden=off &
bspc node "{window}" -g hidden=off &
xdo hide "{window}" &
pos="$(slop -b 2 -c 0.75,0.8,0.96.1 -f 0,%x,%y,%w,%h)"
xdo show "{window}"
bspc node "{window}" -t floating
wmctrl -ir "{window}" -e "$pos"
xdo activate "{window}"'"""
    )


def close(window):
    os.system("xdo close " + window)


def raise_or_minimize(window):
    if get_active_wid() == window:
        os.system("bspc node " + window + " -g hidden=on")
    else:
        os.system("bspc node " + window + " -g hidden=off")
        os.system("wmctrl -ia " + window)


def increment_size(window):
    os.system(f"xdo move -x -{resize_offset} -y -{resize_offset} {window}")
    os.system(f"xdo resize -w +{resize_increment} -h +{resize_increment} {window}")


def decrement_size(window):
    os.system(f"xdo move -x +{resize_offset} -y +{resize_offset} {window}")
    os.system(f"xdo resize -w -{resize_increment} -h -{resize_increment} {window}")


def switch_workspace(workspace):
    os.system(f"bspc desktop -f {workspace}")


def swap_workspace(workspace):
    os.system(f"bspc desktop -s {workspace}")


if __name__ == "__main__":
    # duration = timeit.Timer(main).timeit(number=20)
    # print(duration / 20)
    main()
