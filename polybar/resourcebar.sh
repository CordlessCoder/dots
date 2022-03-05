# script to Tiny-launch polybar

#!/usr/bin/env bash

echo "---" | tee -a /tmp/polybar3.log
polybar resources >> /tmp/polybar3.log 2>&1
