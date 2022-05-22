#!/usr/bin/env python
import os
import urllib.request
from colorthief import ColorThief
import sys
from colorsys import rgb_to_hsv


def colorsel(r, g, b, significance=0):
    temp = rgb_to_hsv(r / 255, g / 255, b / 255)
    return (temp[1] * 0.9 + temp[2]) * (10 - significance)


out = sys.stdout

out.write("#C0CAF5\n")
out.flush()
with open("/tmp/.color", "w") as color:
    color.write(str("#C0CAF5"))

image_pipe = os.popen("playerctl metadata mpris:artUrl --follow 2> /dev/null")


while True:
    url = (
        image_pipe.readline().replace("open.spotify.com", "i.scdn.co").replace("\n", "")
    )
    if len(url) == 0:
        continue

    if url.split(":///")[0].strip() == "file":
        image = url.replace("file://", "")
        image = ColorThief(image).get_palette(color_count=4, quality=2)
    else:
        urllib.request.urlretrieve(url, ".playthumb")
        image = ColorThief(".playthumb").get_palette(color_count=4, quality=2)
    ranked = []
    for i, x in enumerate(image):
        ranked.append([i, x[0], x[1], x[2]])
    image = max(ranked, key=lambda x: colorsel(x[1], x[2], x[3], significance=x[0]))
    image = "#{:02x}{:02x}{:02x}".format(image[1], image[2], image[3])
    # image = f"{image[0]}, {image[1]}, {image[2]}, 255"
    # print(f"{image}")
    out.write(f"{image}\n")
    out.flush()
    with open("/tmp/.color", "w") as color:
        color.write(str(image))
