#!/bin/bash

setxkbmap -layout us,rs,rs -variant ,latin, -option grp:alt_shift_toggle

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

exec i3

