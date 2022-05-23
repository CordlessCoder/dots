#!/usr/bin/env python
import os
import sys


char_limit = 38


colors = {
    "text_color": "#C0CAF5",
    "title_color": "#C0CAF5",
    "album_color": "#C0CAF5",
    "artist_color": "#7AA2F7",
    "title_icon": "#7DCFFF",
    "album_icon": "#7DCFFF",
    "artist_icon": "#7AA2F7",
}


title_icon = "  "
album_icon = "  "
artist_icon = " ﴁ"


icons = {
    "firefox": "",
    "spotify": "",
}


command = os.popen("playerctl metadata --follow")
title = ""
album = ""
artist = ""
printf = sys.stdout.write

printf("%{F" + colors["text_color"] + "}" + "Nothing is playing")
printf("\n")
sys.stdout.flush()

while True:
    update = command.readline()[:-1].split()
    try:
        player = update[0]
    except IndexError:
        printf("%{F" + colors["text_color"] + "}" + "Nothing is playing")
        printf("\n")
        sys.stdout.flush()
    if "title" in update[1]:
        title = " ".join(update[2:])[:char_limit]
    elif "album" in update[1]:
        album = " ".join(update[2:])[:char_limit]
    elif "artist" in update[1]:
        artist = " ".join(update[2:])[:char_limit]
        if len(title) > 0:
            try:
                printf(
                    "%{F"
                    + colors["title_color"]
                    + "}"
                    + title
                    + "%{F"
                    + colors["title_icon"]
                    + "}"
                    + title_icon
                    + "%{F"
                    + colors["text_color"]
                    + "}"
                )
            except KeyError:
                printf(title + title_icon)
        if len(album) > 0:
            try:
                printf(
                    "%{F"
                    + colors["album_color"]
                    + "}"
                    + album
                    + "%{F"
                    + colors["album_icon"]
                    + "}"
                    + album_icon
                    + "%{F"
                    + colors["text_color"]
                    + "}"
                )
            except KeyError:
                printf(album + album_icon)
        if len(artist) > 0:
            try:
                printf(
                    "%{F"
                    + colors["artist_color"]
                    + "}"
                    + artist
                    + "%{F"
                    + colors["artist_icon"]
                    + "}"
                    + artist_icon
                    + "%{F"
                    + colors["text_color"]
                    + "}"
                )
            except KeyError:
                printf(artist + artist_icon)
        printf("\n")
        sys.stdout.flush()
