#!/bin/bash


ON=`xrandr -q | grep '\bconnected' | tail -n1 | cut -d' ' -f1`

[[ $ON -ne "eDP1" ]] && xrandr --output eDP1 --off
xrandr --output $ON --auto

i3 restart
