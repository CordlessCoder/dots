import os
import time

a = os.popen("nvidia-smi -q -d TEMPERATURE -i 0", mode="r").read().split("\n")
a = int(
    [
        a[x].strip()[-4:-2]
        for x in range(len(a))
        if a[x] != ""
        and "Temp" in a[x]
        and "GPU" in a[x]
        and "down" not in a[x]
        and "N/A" not in a[x]
    ][0]
)
print(f" {a}°C" if a <= 30 else f" {a}°C" if a <= 75 else f" {a}°C")
