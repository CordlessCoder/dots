import os

if os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1] == "us":
    os.system("setxkbmap -layout ru")
else:
    os.system("setxkbmap -layout us")
