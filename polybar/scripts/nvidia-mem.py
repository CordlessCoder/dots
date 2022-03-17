import os
import time

while True:
    a = os.popen("nvidia-smi -q -d MEMORY -i 0", mode="r").read().split("\n")
    a = [
        a[x][-8:-4]
        for x in range(len(a))
        if a[x] != "" and "Used" in a[x] or "Total" in a[x]
    ][:2]
    with open("/tmp/.nvidia_mem", "w") as current:
        current.write(f"{int(int(a[1])/int(a[0])*100)}%")
    time.sleep(0.45)
