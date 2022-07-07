#!/bin/sh

python ~/.config/wal/based30.py
pywal-discord || echo "pywal-discord not found"
pywalfox update || echo "pywalfox not found"
wal-telegram || echo "wal-telegram not found"
killall dunst || "Dunst is not running"
killall -USR1 st
