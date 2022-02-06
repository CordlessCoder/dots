import os
import time


a = os.popen("nvidia-smi -q -d MEMORY -i 0", mode="r").read().split("\n")
a = [
    a[x][-8:-4]
    for x in range(len(a))
    if a[x] != "" and "Used" in a[x] or "Total" in a[x]
][:2]
print(f"{int(int(a[1])/int(a[0])*100)}%")
