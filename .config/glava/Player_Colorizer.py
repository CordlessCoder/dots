#!/usr/bin/env python
import os
from PIL import Image
import io
import urllib.request
from colorthief import ColorThief
import time
import sys
from colorsys import rgb_to_hsv


def colorsel(r, g, b):
    temp = rgb_to_hsv(r / 255, g / 255, b / 255)
    return temp[1] * 0.8 + temp[2]


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
            image = max(
                ColorThief(image).get_palette(color_count=4, quality=2),
                key=lambda x: colorsel(x[0], x[1], x[2]),
            )
        else:
            urllib.request.urlretrieve(new_image_url, ".playthumb")
            image = max(
                ColorThief(".playthumb").get_palette(color_count=4, quality=2),
                key=lambda x: colorsel(x[0], x[1], x[2]),
            )
        image = "#{:02x}{:02x}{:02x}".format(image[0], image[1], image[2])
        # image = f"{image[0]}, {image[1]}, {image[2]}, 255"
        # print(f"{image}")
        out.write(f"{image}\n")
        out.flush()
        image_url = new_image_url
    time.sleep(1)
