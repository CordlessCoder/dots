import os

layout = os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1]
if layout == "us":
    os.system("setxkbmap -layout ru")
elif layout == "ru":
    os.system("setxkbmap -layout ua")
else:
    os.system("setxkbmap -layout us")
