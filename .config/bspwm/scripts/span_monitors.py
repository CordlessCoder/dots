#!/usr/bin/env python3
import os

os.system("bspc config remove_unplugged_monitors true")
os.system("bspc config remove_disabled_monitors true")


a = os.popen("bspc query -M", mode="r").read().split("\n")
a.pop()
numbers = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"]
workspaces_per_mon = len(numbers) // len(a)
for i, name in enumerate(a):
    os.system(
        f"bspc monitor {name} -d {' '.join(numbers[workspaces_per_mon * i : (i + 1) * workspaces_per_mon])}"
    )
