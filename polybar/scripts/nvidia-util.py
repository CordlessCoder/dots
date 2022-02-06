import os
import time

a = os.popen("nvidia-smi -q -d UTILIZATION -i 0", mode="r").read().split("\n")
a = int(
    [
        a[x].strip()[-4:-2]
        for x in range(len(a))
        if a[x] != "" and "Gpu" in a[x] or "Memory" in a[x] and "Samples" not in a[x]
    ][0]
)
print(f"{a}%")
