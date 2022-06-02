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
    "red": colors[3],
    "baby_pink": colors[11],
    "pink": colors[11],
    "line": colors[6],
    "green": colors[2],
    "vibrant_green": colors[2],
    "nord_blue": colors[9],
    "blue": colors[1],
    "yellow": colors[4],
    "sun": colors[4],
    "purple": colors[6],
    "dark_purple": colors[14],
    "teal": colors[1],
    "orange": colors[5],
    "cyan": colors[6],
    "statusline_bg": colors[0],
    "lightbg": colors[0],
    "lightbg2": colors[0],
    "pmenu_bg": colors[0],
}
for key in base30.keys():
    base30[key] = colour.Color(base30[key])
base30["darker_black"].luminance = base30["darker_black"].luminance * 0.7
base30["white"].luminance = 0.9
base30["one_bg"].saturation = 0.4
base30["one_bg"].luminance = 0.13
base30["one_bg2"].saturation = 0.5
base30["one_bg2"].luminance = 0.15
base30["one_bg3"].saturation = 0.6
base30["one_bg3"].luminance = 0.17
base30["grey"].saturation = 0.0
base30["grey"].luminance = 0.17
base30["statusline_bg"].luminance = base30["statusline_bg"].luminance * 1.3
base30["lightbg"].luminance = base30["lightbg"].luminance * 1.6
base30["lightbg2"].luminance = base30["lightbg2"].luminance * 1.4
base30["pmenu_bg"].luminance = base30["pmenu_bg"].luminance * 1.7
base30["grey_fg"].saturation = 0.05
base30["grey_fg"].luminance = 0.5
base30["grey_fg2"].saturation = 0.05
base30["grey_fg2"].luminance = 0.65
base30["light_grey"].saturation = 0.05
base30["light_grey"].luminance = 0.75
base30["red"].saturation = 0.8
base30["red"].luminance = 0.45
base30["pink"].saturation = 0.6
base30["pink"].luminance = 0.75
base30["yellow"].saturation = 0.8
base30["yellow"].luminance = 0.75
base30["sun"].saturation = 0.9
base30["sun"].luminance = 0.80
base30["baby_pink"].saturation = 0.6
base30["baby_pink"].luminance = 0.85
base30["blue"].saturation = 0.7
base30["blue"].luminance = 0.6
base30["nord_blue"].saturation = 0.7
base30["nord_blue"].luminance = 0.7
base30["teal"].luminance = 0.3
base30["teal"].saturation = 0.4
base30["green"].luminance = 0.6
base30["green"].saturation = 0.6
base30["vibrant_green"].luminance = 0.6
base30["vibrant_green"].saturation = 0.7
base30["orange"].luminance = 0.6
base30["orange"].saturation = 0.6
base30["purple"].saturation = 0.7
base30["purple"].luminance = 0.6
base30["dark_purple"].saturation = 0.6
base30["dark_purple"].luminance = 0.5
for key in base30.keys():
    out += base30[key].hex_l + "\n"

with open(os.path.expanduser("~/.cache/wal/colors-base30"), "w") as file:
    file.write(out)
