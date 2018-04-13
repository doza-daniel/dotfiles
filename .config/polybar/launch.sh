
#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar example -c ~/.config/polybar/config

feh --bg-scale ~/Pictures/Wallpapers/mountains.jpg

echo "Bars launched..."
