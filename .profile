#!/bin/bash
# Profile file. Runs on login.

export PATH="$HOME/.local/bin/:$PATH"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export MANPAGER="nvim +Man!"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Source bashrc
echo "$0" | grep "bash$" >/dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
