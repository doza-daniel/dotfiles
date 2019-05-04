#!/bin/bash

setxkbmap -layout us,rs,rs -variant ,latin, -option grp:ctrls_toggle

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -f ~/.scripts/screenlayout ] && ~/.scripts/screenlayout

exec i3

