#!/usr/bin/env python
import os
from PIL import Image
import urllib.request
from colorthief import ColorThief
import time
import sys
from colorsys import rgb_to_hsv


def colorsel(r, g, b, significance=0):
    temp = rgb_to_hsv(r / 255, g / 255, b / 255)
    return (temp[1] * 0.9 + temp[2]) * (10 - significance)


image_url = ""

out = sys.stdout


while True:
    new_image_url = (
        os.popen("playerctl metadata mpris:artUrl 2>/dev/null")
        .read()
        .replace("open.spotify.com", "i.scdn.co")
        .replace("\n", "")
    )
    if new_image_url != image_url and len(new_image_url) > 0:
        if new_image_url.split(":///")[0].strip() == "file":
            direct_path = new_image_url.replace("file://", "")
            image = direct_path
            image = ColorThief(image).get_palette(color_count=4, quality=2)
        else:
            urllib.request.urlretrieve(new_image_url, ".playthumb")
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
        image_url = new_image_url
    time.sleep(1)
