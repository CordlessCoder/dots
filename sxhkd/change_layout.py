import os
import sys


try:
    args = sys.argv[1]
    with open("/tmp/.current_layout", "w") as current:
        current.write(args)
        os.system(f"setxkbmap -layout {args}")
except:
    current_layout = (
        os.popen("setxkbmap -query", mode="r").read().split("\n")[2].split()[1]
    )
    with open("/tmp/.current_layout", "w") as current:
        if current_layout == "us":
            os.system("setxkbmap -layout ua")
            current.write("ua")
        elif current_layout == "ua":
            os.system("setxkbmap -layout ru")
            current.write("ru")
        else:
            os.system("setxkbmap -layout us")
            current.write("us")
