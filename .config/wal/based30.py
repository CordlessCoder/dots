#!/usr/bin/env python
import os
import colour


out = ""


with open(os.path.expanduser("~/.cache/wal/colors")) as file:
    colors = [x[:-1] for x in file.readlines()]


base30 = {
    "white": colors[15],
    "darker_black": colors[0],
    "black": colors[0],
    "black2": colors[0],
    "one_bg": colors[0],
    "one_bg2": colors[0],
    "one_bg3": colors[0],
    "grey": colors[8],
    "grey_fg": colors[7],
    "grey_fg2": colors[7],
    "light_grey": colors[7],
    "red": colors[1],
    "baby_pink": colors[9],
    "pink": colors[9],
    "line": colors[0],
    "green": colors[2],
    "vibrant_green": colors[10],
    "nord_blue": colors[12],
    "blue": colors[4],
    "yellow": colors[3],
    "sun": colors[3],
    "purple": colors[13],
    "dark_purple": colors[5],
    "teal": colors[2],
    "orange": colors[3],
    "cyan": colors[2],
    "statusline_bg": colors[8],
    "lightbg": colors[0],
    "pmenu_bg": colors[1],
    "folder_bg": colors[12],
    "bright_white": colors[15],
}
for key in base30.keys():
    base30[key] = colour.Color(base30[key])

#    white = "#A0A8CD",
#    darker_black = "#0c0d18",
#    black = "#11121D", --  nvim bg
#    black2 = "#171823",
#    one_bg = "#1d1e29",
#    one_bg2 = "#252631",
#    one_bg3 = "#252631",
#    grey = "#40414c",
#    grey_fg = "#474853",
#    grey_fg2 = "#4e4f5a",
#    light_grey = "#545560",
#    red = "#ee6d85",
#    baby_pink = "#fd7c94",
#    pink = "#fe6D85",
#    line = "#191a25",
#    green = "#98c379",
#    vibrant_green = "#95c561",
#    nord_blue = "#648ce1",
#    blue = "#7199ee",
#    yellow = "#d7a65f",
#    sun = "#dfae67",
#    purple = "#a485dd",
#    dark_purple = "#9071c9",
#    teal = "#519aba",
#    orange = "#f6955b",
#    cyan = "#38a89d",
#    statusline_bg = "#161722",
#    lightbg = "#2a2b36",
#    pmenu_bg = "#ee6d85",
#    folder_bg = "#7199ee",
base30["white"].saturation = 0.13
base30["white"].luminance = 0.75
base30["white"].hue = base30["white"].hue + 0.06
base30["darker_black"].luminance = base30["darker_black"].luminance * 0.8
base30["black2"].luminance = (
    base30["black2"].luminance * 1.35 if base30["black2"].luminance * 1.35 < 1 else 1
)
base30["one_bg"].saturation = 0.15
base30["one_bg"].luminance = 0.13
base30["one_bg2"].saturation = 0.15
base30["one_bg2"].luminance = 0.2
base30["one_bg3"].saturation = 0.15
base30["one_bg3"].luminance = 0.2
base30["grey"].saturation = 0.20
base30["grey"].luminance = 0.27
base30["grey_fg"].saturation = 0.22
base30["grey_fg"].luminance = 0.32
base30["grey_fg2"].saturation = 0.23
base30["grey_fg2"].luminance = 0.36
base30["light_grey"].saturation = 0.24
base30["light_grey"].luminance = 0.41
base30["red"].luminance = base30["red"].luminance * 0.95
base30["baby_pink"].luminance = (
    base30["baby_pink"].luminance * 1.1 if base30["baby_pink"].luminance * 1.1 < 1 else 1
)
base30["line"].luminance = 0.13
base30["green"].luminance = (
    base30["green"].luminance * 1.1 if base30["green"].luminance * 1.1 < 1 else 1
)
base30["nord_blue"].luminance = base30["nord_blue"].luminance * 0.95
base30["sun"].luminance = base30["sun"].luminance * 1.1 if base30["sun"].luminance * 1.1 < 1 else 1
base30["dark_purple"].luminance = base30["dark_purple"].luminance * 0.95
base30["teal"].hue = base30["teal"].hue + 0.26
base30["orange"].saturation = (
    base30["orange"].saturation * 1.1 if base30["orange"].saturation * 1.4 < 1 else 1
)
base30["orange"].luminance = 0.5
base30["cyan"].hue = base30["cyan"].hue + 0.18
base30["statusline_bg"] = base30["black2"]
base30["lightbg"].saturation = 0.24
base30["lightbg"].luminance = 0.16
for key in base30.keys():
    out += base30[key].hex_l + "\n"
    # if (
    #     "white" in key
    #     or "black" in key
    #     or "one" in key
    #     or "grey" in key
    #     or "red" in key
    #     or "pink" in key
    #     or "line" in key
    #     or "green" in key
    #     or "blue" in key
    #     or "yellow" in key
    #     or "sun" in key
    #     or "purple" in key
    # ):
    #     continue
    print(key + ":" + " " * (13 - len(key)), base30[key].hex_l)

with open(os.path.expanduser("~/.cache/wal/colors-base30"), "w") as file:
    file.write(out)
