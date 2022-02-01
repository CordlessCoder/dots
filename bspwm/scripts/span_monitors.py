import os

a = os.popen("bspc query -M --names", mode="r").read().split("\n")
a.pop()
numbers = ["I", "II", "III", "IV", "V", "VI", "VII", "IIX", "IX", "X"]
workspaces_per_mon = 10 // len(a)
for i, name in enumerate(a):
    os.system(
        f"bspc monitor {name} -d {' '.join(numbers[workspaces_per_mon * i : (i + 1) * workspaces_per_mon])}"
    )
