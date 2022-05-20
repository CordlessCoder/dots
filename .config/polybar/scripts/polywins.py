#!/usr/bin/env python
import sys
import os
import fontawesome as fa

# import timeit

# BSPWINS.py

# SETTINGS

active_text_color = "#EB6572"
active_bg = "#24283B"
active_underline = "#EB6572"

inactive_text_color = "#C0CAF5"
inactive_bg = ""
inactive_underline = "#C0CAF5"

name_style = "upper"  # options: upper, lower, None
separator = " "
show = "window_class"  # options: window_title, window_class, window_classname
forbidden_classes = "Polybar Conky Gmrun Pavucontrol".lower().split(" ")
hide_unpopulated_desktops = False
iconize = True
hide_name = True  # Controls whether to hide window names when an icon is present

char_limit = 10
max_windows = 10
add_spaces = "true"
resize_increment = 16
resize_offset = resize_increment / 2


# WINDOW LIST SETUP


active_left = "%{F" + active_text_color + "}"
active_right = "%{F-}"
inactive_left = "%{F" + inactive_text_color + "}"
inactive_right = "%{F-}"
# separator = "%{F" + inactive_text_color + "}" + separator + "%{F-}"

wps_active_left = "%{F" + inactive_text_color + "}%{+u}%{u" + inactive_underline + "}"

wps_active_right = "%{-u}%{u}%{F-}"
wps_inactive_left = "%{F" + inactive_text_color + "}"
wps_inactive_right = "%{F-}"

if active_underline is not None:
    active_left = active_left + "%{+u}%{u" + active_underline + "}"
    active_right = "%{-u}" + active_right


if inactive_underline is not None:
    inactive_left += "%{+u}%{u" + inactive_underline + "}"
    inactive_right = "%{-u}" + inactive_right


on_click = " ".join(sys.argv[:2])
monitor = sys.argv[1]


printf = sys.stdout.write


superscript = str.maketrans("0123456789", "⁰¹²³⁴⁵⁶⁷⁸⁹")


class_icons = {
    "alacritty": fa.icons["terminal"],
    "atom": fa.icons["code"],
    "vscode": fa.icons["code"],
    "neovim": fa.icons["code"],
    "banshee": fa.icons["play"],
    "blender": fa.icons["cube"],
    "chromium": fa.icons["chrome"],
    "cura": fa.icons["cube"],
    "darktable": fa.icons["image"],
    "discord": fa.icons["comment"],
    "eclipse": fa.icons["code"],
    "emacs": fa.icons["code"],
    "eog": fa.icons["image"],
    "evince": fa.icons["file-pdf"],
    "evolution": fa.icons["envelope"],
    "feh": fa.icons["image"],
    "file-roller": fa.icons["compress"],
    "filezilla": fa.icons["server"],
    "firefox": fa.icons["firefox"],
    "firefox-esr": fa.icons["firefox"],
    "firefoxdev": fa.icons["firefox"],
    "navigator": fa.icons["firefox"],
    "gimp": fa.icons["image"],
    "gimp-2.8": fa.icons["image"],
    "gnome-control-center": fa.icons["toggle-on"],
    "gnome-terminal-server": fa.icons["terminal"],
    "google-chrome": fa.icons["chrome"],
    "prusa-slicer": fa.icons["cube"],
    "gpick": fa.icons["eye-dropper"],
    "imv": fa.icons["image"],
    "insomnia": fa.icons["globe"],
    "java": fa.icons["code"],
    "jetbrains-idea": fa.icons["code"],
    "jetbrains-studio": fa.icons["code"],
    "keepassxc": fa.icons["key"],
    "keybase": fa.icons["key"],
    "kicad": fa.icons["microchip"],
    "kitty": fa.icons["terminal"],
    "libreoffice": fa.icons["file-alt"],
    "lua5.1": fa.icons["moon"],
    "mpv": fa.icons["tv"],
    "mupdf": fa.icons["file-pdf"],
    "mysql-workbench-bin": fa.icons["database"],
    "nautilus": fa.icons["copy"],
    "nemo": fa.icons["copy"],
    "openscad": fa.icons["cube"],
    "pavucontrol": fa.icons["volume-up"],
    "postman": fa.icons["space-shuttle"],
    "rhythmbox": fa.icons["play"],
    "robo3t": fa.icons["database"],
    "signal": fa.icons["comment"],
    "slack": fa.icons["slack"],
    "slic3r.pl": fa.icons["cube"],
    "spotify": fa.icons["music"],  # could also use the 'spotify' icon
    "steam": fa.icons["steam"],
    "subl": fa.icons["file-alt"],
    "subl3": fa.icons["file-alt"],
    "sublime_text": fa.icons["file-alt"],
    "thunar": fa.icons["copy"],
    "thunderbird": fa.icons["envelope"],
    "totem": fa.icons["play"],
    "urxvt": fa.icons["terminal"],
    "xfce4-terminal": fa.icons["terminal"],
    "xournal": fa.icons["file-alt"],
    "yelp": fa.icons["code"],
    "zenity": fa.icons["window-maximize"],
    "zoom": fa.icons["comment"],
}


def get_active_wid():
    return os.popen("bspc query -N -n .focused").read()[:-1]


def ensure_len(ID, length=10):
    while len(ID) < length - 1:
        ID = "0x0" + ID[2:]
    return ID


if hide_name:

    def to_icon(name):
        try:
            return class_icons[name.lower()] + " "
        except:
            return name[:char_limit]

else:

    def to_icon(name):
        try:
            return class_icons[name.lower()] + " " + name[:char_limit]
        except:
            return name[:char_limit]


def wid_to_name(wid):
    if not isinstance(wid, list):
        if show == "window_class":
            out = os.popen(f"xprop -id {wid} WM_CLASS 2> /dev/null").read().split('"')
        if show == "window_classname":
            out = (
                os.popen(f"xprop -id {wid} WM_CLASS 2> /dev/null")
                .read()
                .split('"')[:-1][-1]
            )
        if show == "window_title":
            out = (
                os.popen(f"xprop -id {wid} _NET_WM_NAME 2> /dev/null")
                .read()
                .split('"')[1]
            )
        if name_style == "upper":
            out = out.upper()
        elif name_style == "lower":
            out = out.lower()
        return out
    else:
        out = {}
        for id in wid:
            if show == "window_class":
                name = (
                    os.popen(f"xprop -id {id} WM_CLASS 2> /dev/null")
                    .read()
                    .split('"')[1]
                )
            if show == "window_classname":
                name = (
                    os.popen(f"xprop -id {id} WM_CLASS 2> /dev/null")
                    .read()
                    .split('"')[-2]
                )
            if show == "window_title":
                name = (
                    os.popen(f"xprop -id {id} _NET_WM_NAME 2> /dev/null")
                    .read()
                    .split('"')[1]
                )
            if name.lower() not in forbidden_classes:
                if iconize:
                    name = to_icon(name)
                try:
                    out[name].append(id)
                except:
                    out[name] = [id]
        return out


def generate(workspaces, focused_win="", focused_desk="", order=[]):
    out = ""
    for workspace_id in order:
        if len(workspaces[workspace_id][0]) < hide_unpopulated_desktops:
            continue
        out += (
            "%{A1:"
            + on_click
            + " switch_workspace "
            + workspace_id
            + ":}"
            + "%{A2:"
            + on_click
            + " swap_workspace "
            + workspace_id
            + ":}"
            + wps_inactive_left
            + separator
            + workspaces[workspace_id][1]
            + "%{A}%{A}"
            if workspace_id != focused_desk
            else wps_active_left + separator + workspaces[workspace_id][1]
        )
        if len(workspaces[workspace_id][0]) == 0:
            out += separator + wps_active_right
        else:
            out += ":"
            windows = wid_to_name(workspaces[workspace_id][0])
            for i, win_class in enumerate(windows.keys()):
                if i == max_windows:
                    break
                wid = " ".join(windows[win_class])
                if focused_win in windows[win_class]:
                    out += active_left
                out += (
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
                out += separator
                out += win_class.upper()
                out += (
                    separator
                    if len(windows[win_class]) <= 1
                    else str(len(windows[win_class])).translate(superscript)
                )
                out += active_right + "%{A}%{A}%{A}%{A}%{A}"
            out += wps_active_right
            if len(windows.keys()) > max_windows:
                out += f"+{len(windows.keys())-max_windows}"
    return out


def main():
    if len(sys.argv) <= 2:
        command = os.popen(
            "bspc subscribe desktop_focus desktop_add desktop_rename desktop_remove desktop_swap node_add node_remove node_swap node_transfer node_focus"
        )
        mon_id = os.popen(f"bspc query -M -m '{monitor}'").read()[:-1]
        workspace_order = []
        workspaces = {}  # workspace ID and name pairs
        for workspace in [
            workspace[:-1]
            for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()
        ]:
            workspace_order.append(workspace)
            workspaces[workspace] = (
                [
                    window[:-1]
                    for window in os.popen(
                        f"bspc query -N -d {workspace} -n .window"
                    ).readlines()
                ],
                os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
            )

        focused_workspace = os.popen(f"bspc query -D -m {mon_id} -d .focused").read()[
            :-1
        ]  # ID of the currently focused workspace
        focused = os.popen(f"bspc query -N -m {mon_id} -n .focused").read()[
            :-1
        ]  # ID of the currently focused window
        try:
            printf(
                generate(
                    workspaces,
                    focused_win=focused,
                    focused_desk=focused_workspace,
                    order=workspace_order,
                )
            )
            printf("\n")
            sys.stdout.flush()
        except:
            workspace_order = []
            workspaces = {}  # workspace ID and name pairs
            for workspace in [
                workspace[:-1]
                for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()
            ]:
                workspace_order.append(workspace)
                workspaces[workspace] = (
                    [
                        window[:-1]
                        for window in os.popen(
                            f"bspc query -N -d {workspace} -n .window"
                        ).readlines()
                    ],
                    os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
                )
                focused_workspace = os.popen(
                    f"bspc query -D -m {mon_id} -d .focused"
                ).read()[
                    :-1
                ]  # ID of the currently focused workspace

        while True:
            update = command.readline()[:-1]
            if mon_id in update:
                if "node" in update:
                    update = update[5:].split(" ")
                    if update[0] == "focus":
                        focused = update[-1]
                    elif update[0] == "add":
                        workspaces[update[2]][0].append(update[4])
                    elif update[0] == "remove":
                        workspaces[update[2]][0].remove(update[3])
                    elif update[0] == "swap":
                        if update[1] == mon_id:
                            workspaces[update[2]][0].remove(update[3])
                            workspaces[update[2]][0].append(update[6])
                        if update[4] == mon_id:
                            workspaces[update[5]][0].remove(update[6])
                            workspaces[update[5]][0].append(update[3])
                    else:
                        if update[1] == mon_id:
                            workspaces[update[2]][0].remove(update[3])
                        if update[4] == mon_id:
                            workspaces[update[5]][0].append(update[3])
                else:
                    update = update[8:].split(" ")
                    if update[0] == "focus":
                        focused_workspace = update[-1]
                    elif update[0] == "add":
                        workspaces[update[2]] = ([], update[-1])
                    elif update[0] == "rename":
                        workspaces[update[2]] = (
                            [
                                window[:-1]
                                for window in os.popen(
                                    f"bspc query -N -d {update[2]}"
                                ).readlines()
                            ],
                            update[-1],
                        )
                    elif update[0] == "remove":
                        workspaces.pop(update[-1])
                    else:
                        if update[1] == mon_id and update[3] == mon_id:
                            index = workspace_order.index(update[4])
                            workspace_order[workspace_order.index(update[2])] = update[
                                4
                            ]
                            workspace_order[index] = update[2]
                        else:
                            workspace_order = []
                            workspaces = {}  # workspace ID and name pairs
                            for workspace in [
                                workspace[:-1]
                                for workspace in os.popen(
                                    f"bspc query -D -m '{mon_id}'"
                                ).readlines()
                            ]:
                                workspace_order.append(workspace)
                                workspaces[workspace] = (
                                    [
                                        window[:-1]
                                        for window in os.popen(
                                            f"bspc query -N -d {workspace} -n .window"
                                        ).readlines()
                                    ],
                                    os.popen(
                                        f"bspc query -D -d {workspace} --names"
                                    ).read()[:-1],
                                )
                                focused_workspace = os.popen(
                                    f"bspc query -D -m {mon_id} -d .focused"
                                ).read()[
                                    :-1
                                ]  # ID of the currently focused workspace

                try:
                    printf(
                        generate(
                            workspaces,
                            focused_win=focused,
                            focused_desk=focused_workspace,
                            order=workspace_order,
                        )
                    )
                    printf("\n")
                    sys.stdout.flush()
                except:
                    workspace_order = []
                    workspaces = {}  # workspace ID and name pairs
                    for workspace in [
                        workspace[:-1]
                        for workspace in os.popen(
                            f"bspc query -D -m '{mon_id}'"
                        ).readlines()
                    ]:
                        workspace_order.append(workspace)
                        workspaces[workspace] = (
                            [
                                window[:-1]
                                for window in os.popen(
                                    f"bspc query -N -d {workspace} -n .window"
                                ).readlines()
                            ],
                            os.popen(f"bspc query -D -d {workspace} --names").read()[
                                :-1
                            ],
                        )
                        focused_workspace = os.popen(
                            f"bspc query -D -m {mon_id} -d .focused"
                        ).read()[
                            :-1
                        ]  # ID of the currently focused workspace

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
