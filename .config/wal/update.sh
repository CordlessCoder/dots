#!/bin/sh

pywal-discord || echo "pywal-discord not found"
pywalfox update || echo "pywalfox not found"
wal-telegram || echo "wal-telegram not found"
python ~/.config/wal/based30.py
killall dunst
killall glava
killall -USR1 st
