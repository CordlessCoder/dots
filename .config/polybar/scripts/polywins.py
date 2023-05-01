#!/usr/bin/env python
import sys
import os


# POLYWINS.py
# A polywins alternative for BSPWM, written in python, listening to BSPC for low overhead and BSPWM integration.

# SETTINGS


name_style = str.capitalize  # what function to apply to the name
separator = " "  # What to separate EVERYTHING with
windowlist_prefix = " "  # prefix before listing windows, default is ":"
show = "window_class"  # one of: ["window_class", "window_classname", "window_title"]
# icons are only properly supported with window_class
forbidden_classes = ("polybar", "conky", "gmrun", "pavucontrol")  # Windows of what classes to not list
hide_unpopulated_desktops = False
iconize = True  # Whether to convert known apps to their icon versions
# DEFINITELY requires a font patched with Nerd Fonts, just like most of this
hide_name = True  # Controls whether to hide window names when an icon is present

char_limit = 10
max_windows = 10
resize_increment = 16
resize_offset = resize_increment / 2
use_pywal = True


override_names = [
    "",
    "",
    "ﱣ",
]  # Either a list containing the focused, occupied and unfocused versions of workspace name, or False

underline = False


highlight_active_wps = False
# Whether to highlight the active workspace, and if yes you can also specify the highlight color it'll use in hex
# or if using pywal, the base16 color index

if len(sys.argv) <= 2:
    try:
        if use_pywal is not True:
            raise TypeError
        with open(os.path.expanduser("~/.cache/wal/colors")) as colors:
            colors = tuple(map(lambda x: x[:-1], colors.readlines()))
        assert isinstance(colors, tuple)
        active_text_color = colors[1]
        active_underline = colors[1] if underline is not False else None
        inactive_text_color = colors[7]
        inactive_underline = colors[7] if underline is not False else None

    except (OSError, IndexError, TypeError):
        active_text_color = "#EB6572"
        active_underline = "#EB6572" if underline is not False else None
        inactive_text_color = "#C0CAF5"
        inactive_underline = "#C0CAF5" if underline is not False else None

    forbidden_classes = map(str.casefold, forbidden_classes)

    # WINDOW LIST SETUP

    active_left = "%{F" + active_text_color + "}"
    active_right = "%{F-}"
    inactive_left = "%{F" + inactive_text_color + "}"
    inactive_right = "%{F-}"
    # separator = "%{F" + inactive_text_color + "}" + separator + "%{F-}"

    wps_active_left = (
        "%{F"
        + (
            inactive_text_color
            if highlight_active_wps is False
            else (
                active_text_color
                if highlight_active_wps is True
                else (
                    highlight_active_wps
                    if isinstance(highlight_active_wps, str)
                    else (colors[highlight_active_wps] if len(colors) > highlight_active_wps else active_text_color)
                )
            )
        )
        + "}"
    )
    wps_active_right = "%{F-}"
    wps_inactive_left = "%{F" + inactive_text_color + "}"
    wps_inactive_right = "%{F-}"
    if active_underline is not None:
        active_left = active_left + "%{+u}%{u" + active_underline + "}"
        active_right = "%{-u}" + active_right
        wps_active_left = (
            "%{F" + inactive_text_color + "}%{+u}" + ("%{u" + inactive_underline + "}")
            if isinstance(inactive_underline, str)
            else ""
        )
        wps_active_right = "%{-u}%{u}%{F-}"

    if inactive_underline is not None:
        inactive_left += "%{+u}%{u" + inactive_underline + "}"
        inactive_right = "%{-u}" + inactive_right

    on_click = " ".join(sys.argv[:2])
    monitor = sys.argv[1]

    printf = sys.stdout.write

    superscript = str.maketrans("0123456789", "⁰¹²³⁴⁵⁶⁷⁸⁹")

    class_icons = {
        "obs": "",
        "obsidian": "",
        "qbittorrent": "",
        "alacritty": "",
        "atom": "",
        "vscode": "",
        "code": "",
        "code-oss": "",
        "neovim": "",
        "nvim": "",
        "nvim-qt": "",
        "neovide": "",
        "banshee": "",
        "blender": "",
        "chromium": "",
        "google-chrome": "",
        "cura": "",
        "darktable": "",
        "discord": "ﭮ",
        "eclipse": "",
        "emacs": "",
        "eog": "",
        "evince": "",
        "evolution": "",
        "feh": "",
        "file-roller": "ﭕ",
        "filezilla": "",
        "firefox": "",
        "firefox-esr": "",
        "firefoxdev": "",
        "navigator": "",
        "gimp": "",
        "gimp-2.8": "",
        "gnome-control-center": "",
        "gnome-terminal-server": "",
        "prusa-slicer": "",
        "gpick": "",
        "imv": "",
        "insomnia": "",
        "java": "",
        "jetbrains-idea": "",
        "jetbrains-studio": "",
        "keepassxc": "",
        "keybase": "",
        "kicad": "",
        "kitty": "",
        "st-256color": "",
        "st": "",
        "libreoffice": "",
        "lua5.1": "",
        "mpv": "",
        "mupdf": "",
        "mysql-workbench-bin": "",
        "nautilus": "",
        "nemo": "",
        "openscad": "",
        "pavucontrol": "",
        "postman": "",
        "rhythmbox": "蓼",
        "robo3t": "",
        "signal": "",
        "slack": "",
        "slic3r.pl": "",
        "spotify": "",
        "steam": "",
        "subl": "",
        "subl3": "",
        "sublime_text": "",
        "thunar": "",
        "thunderbird": "",
        "totem": "",
        "urxvt": "",
        "xfce4-terminal": "",
        "xournal": "",
        "yelp": "",
        "zenity": "",
        "zoom": "",
        "telegram": "",
        "telegram-desktop": "",
        "kotatogram": "",
        "lunarclient": "",
        "viber": "",
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
        except KeyError:
            if not name.casefold().startswith("lunar client"):
                return name[:char_limit]
            else:
                return " "

else:

    def to_icon(name):
        try:
            return class_icons[name.lower()] + " " + name[:char_limit]
        except KeyError:
            if not name.casefold().startswith("lunar client"):
                return name[:char_limit]
            else:
                return ""


def wid_to_name(wid, cache={}):
    if not isinstance(wid, list):
        if show == "window_class":
            out = os.popen(f"xprop -id {wid} WM_CLASS 2> /dev/null").read().split('"')
        elif show == "window_classname":
            out = os.popen(f"xprop -id {wid} WM_CLASS 2> /dev/null").read().split('"')[:-1][-1]
        else:
            out = os.popen(f"xprop -id {wid} _NET_WM_NAME 2> /dev/null").read().split('"')[1]
        if name_style is not None:
            return name_style(out)
        return out
    else:
        out = {}
        cached = cache.keys()
        for id in wid:
            if id not in cached:
                if show == "window_class":
                    name = os.popen(f"xprop -id {id} WM_CLASS 2> /dev/null").read().split('"')[1]
                elif show == "window_classname":
                    name = os.popen(f"xprop -id {id} WM_CLASS 2> /dev/null").read().split('"')[-2]
                else:
                    name = os.popen(f"xprop -id {id} _NET_WM_NAME 2> /dev/null").read().split('"')[1]
                if name.casefold() not in forbidden_classes:
                    if iconize:
                        name = to_icon(name)
                    try:
                        out[name].append(id)
                    except KeyError:
                        out[name] = [id]
                    cache[id] = name
            else:
                try:
                    out[cache[id]].append(id)
                except KeyError:
                    out[cache[id]] = [id]
        return out, cache


def generate(workspaces, focused_desk, order):
    global classcache
    focused = os.popen(f"bspc query -N -m {mon_id} -n .focused").read()[:-1]  # ID of the currently focused window
    for workspace_id in order:
        if len(workspaces[workspace_id][0]) < hide_unpopulated_desktops and workspace_id != focused_desk:
            continue
        printf(
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
            + (
                workspaces[workspace_id][1]
                if override_names is False
                else (override_names[1] if len(workspaces[workspace_id][0]) else override_names[0])
            )
            if workspace_id != focused_desk
            else wps_active_left + separator + (workspaces[workspace_id][1] if override_names is False else override_names[2])
        )
        if len(workspaces[workspace_id][0]) == 0:
            printf(separator + wps_active_right + "%{A}%{A}")
        else:
            printf(windowlist_prefix + "%{A}%{A}")
            windows, classcache = wid_to_name(workspaces[workspace_id][0], classcache)
            win_length = len(windows.keys())
            for i, win_class in enumerate(windows.keys()):
                if i == max_windows:
                    break
                wid = " ".join(windows[win_class])
                printf(
                    "%{A1:"
                    + on_click
                    + " focus "
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
                printf(active_left if focused in windows[win_class] else inactive_left)
                printf(separator if i == 0 else "")
                printf(name_style(win_class) if name_style is not None else win_class)
                printf(
                    (separator if i < (win_length - 1) else "")
                    if len(windows[win_class]) <= 1
                    else str(len(windows[win_class])).translate(superscript)
                )
                printf(active_right + "%{A}%{A}%{A}%{A}%{A}")
            printf(wps_active_right)
            if len(windows.keys()) > max_windows:
                printf(f"+{len(windows.keys())-max_windows}")

    # printf(suffix)


def main():
    if len(sys.argv) <= 2:
        # focused = ""
        command = os.popen(
            "bspc subscribe desktop_focus desktop_add desktop_rename desktop_remove desktop_swap node_add node_remove node_swap node_transfer node_focus"
        )
        global mon_id
        mon_id = os.popen(f"bspc query -M -m '{monitor}'").read()[:-1]
        workspace_order = []
        workspaces = {}  # workspace ID and name pairs
        for workspace in [workspace[:-1] for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()]:
            workspace_order.append(workspace)
            workspaces[workspace] = (
                [window[:-1] for window in os.popen(f"bspc query -N -d {workspace} -n .window").readlines()],
                os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
            )

        focused_workspace = os.popen(f"bspc query -D -m {mon_id} -d .focused").read()[
            :-1
        ]  # ID of the currently focused workspace
        global classcache
        classcache = {}
        try:
            generate(
                workspaces,
                focused_workspace,
                workspace_order,
            )
            printf("\n")
            sys.stdout.flush()
        except:
            workspace_order = []
            workspaces = {}  # workspace ID and name pairs
            for workspace in [workspace[:-1] for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()]:
                workspace_order.append(workspace)
                workspaces[workspace] = (
                    [window[:-1] for window in os.popen(f"bspc query -N -d {workspace} -n .window").readlines()],
                    os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
                )
                focused_workspace = os.popen(f"bspc query -D -m {mon_id} -d .focused").read()[
                    :-1
                ]  # ID of the currently focused workspace

        while True:
            update = command.readline()[:-1]
            if (
                mon_id in update
                or update.startswith("node_remove")
                or update.startswith("node_focus")
                or update.startswith("desktop_focus")
            ):
                if update.startswith("node"):
                    update = update[5:].split(" ")
                    if update[0] == "focus":
                        # global focused
                        # focused = update[3]
                        pass
                    elif update[0] == "add":
                        try:
                            workspaces[update[2]][0].append(update[4])
                        except KeyError:
                            pass
                    elif update[0] == "remove":
                        classcache.pop(update[3], None)
                        try:
                            workspaces[update[2]][0].remove(update[3])
                        except KeyError:
                            continue
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
                            [window[:-1] for window in os.popen(f"bspc query -N -d {update[2]}").readlines()],
                            update[-1],
                        )
                    elif update[0] == "remove":
                        workspaces.pop(update[-1], None)
                    else:
                        if update[1] == mon_id and update[3] == mon_id:
                            index = workspace_order.index(update[4])
                            workspace_order[workspace_order.index(update[2])] = update[4]
                            workspace_order[index] = update[2]
                        else:
                            workspace_order = []
                            workspaces = {}  # workspace ID and name pairs
                            for workspace in [
                                workspace[:-1] for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()
                            ]:
                                workspace_order.append(workspace)
                                workspaces[workspace] = (
                                    [window[:-1] for window in os.popen(f"bspc query -N -d {workspace} -n .window").readlines()],
                                    os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
                                )
                                focused_workspace = os.popen(f"bspc query -D -m {mon_id} -d .focused").read()[
                                    :-1
                                ]  # ID of the currently focused workspace

                try:
                    generate(
                        workspaces,
                        focused_workspace,
                        workspace_order,
                    )
                    printf("\n")
                    sys.stdout.flush()
                except:
                    workspace_order = []
                    workspaces = {}  # workspace ID and name pairs
                    for workspace in [workspace[:-1] for workspace in os.popen(f"bspc query -D -m '{mon_id}'").readlines()]:
                        workspace_order.append(workspace)
                        workspaces[workspace] = (
                            [window[:-1] for window in os.popen(f"bspc query -N -d {workspace} -n .window").readlines()],
                            os.popen(f"bspc query -D -d {workspace} --names").read()[:-1],
                        )
                        focused_workspace = os.popen(f"bspc query -D -m {mon_id} -d .focused").read()[
                            :-1
                        ]  # ID of the currently focused workspace
                        command = os.popen(
                            "bspc subscribe desktop_focus desktop_add desktop_rename desktop_remove desktop_swap node_add node_remove node_swap node_transfer node_focus"
                        )
    else:
        exec(sys.argv[2] + "(" + "'" + " ".join(sys.argv[3:]) + "')")


def slop_resize(window):
    window = sorted(window.split(" "))
    try:
        window = window[window.index(get_active_wid())]
    except ValueError:
        window = window[0]
    os.system(
        f"""bash -c 'bspc node "{window}" -g hidden=off &
bspc node "{window}" -g hidden=off &
xdo hide "{window}" &
pos="$(slop -b 2 -c 0.75,0.8,0.96.1 -f 0,%x,%y,%w,%h)"
xdo show "{window}"
bspc node "{window}" -t floating
bspc node "{window}" -d focused
wmctrl -ir "{window}" -e "$pos"
xdo activate "{window}"'"""
    )


def close(window):
    window = sorted(window.split(" "))
    try:
        window = window[window.index(get_active_wid())]
    except ValueError:
        window = window[0]
    os.system("xdo close " + window)


def focus(window):
    window = sorted(window.split(" "))
    try:
        window = window[(window.index(get_active_wid()) + 1) % len(window)]
        os.system("bspc node " + window + " -g hidden=off")
        # os.system("bspc node -s " + window)
        os.system("bspc node -f " + window)
    except ValueError:
        window = window[0]
        os.system("bspc node " + window + " -g hidden=off")
        os.system("bspc node -f " + window)
        os.system("wmctrl -ia " + window)


def increment_size(window):
    window = sorted(window.split(" "))
    try:
        window = window[window.index(get_active_wid())]
    except ValueError:
        window = window[0]
    os.system(f"xdo move -x -{resize_offset} -y -{resize_offset} {window}")
    os.system(f"xdo resize -w +{resize_increment} -h +{resize_increment} {window}")


def decrement_size(window):
    window = sorted(window.split(" "))
    try:
        window = window[window.index(get_active_wid())]
    except ValueError:
        window = window[0]
    os.system(f"bspc node {window} -t floating")
    os.system(f"xdo move -x +{resize_offset} -y +{resize_offset} {window}")
    os.system(f"xdo resize -w -{resize_increment} -h -{resize_increment} {window}")


def switch_workspace(workspace):
    os.system(f"bspc desktop -f {workspace}")


def swap_workspace(workspace):
    os.system(f"bspc desktop -s {workspace}")


if __name__ == "__main__":
    main()
