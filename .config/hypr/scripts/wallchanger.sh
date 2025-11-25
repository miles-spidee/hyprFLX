#!/bin/bash
# Auto wallpaper changer for Hyprland (uses the same script as your hotkey)

# Time interval between wallpaper changes (in seconds)
DELAY=30

# Path to your wallpaper switcher script
scrPath="/home/aki/.local/share/bin"

while true; do
    "$scrPath/swwwallpaper.sh" -n
    sleep "$DELAY"
done
