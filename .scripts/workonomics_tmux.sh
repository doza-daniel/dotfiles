#!/bin/bash

SESSION=workonomics

tmux new-session -s $SESSION -n "development" -c /home/daniel/GoLang/src/gitlab.com/workonomics/usersapi \; \
    new-window -n "database" -c /home/daniel/GoLang/src/gitlab.com/workonomics/database \; \
    new-window -n "testing" -c /home/daniel/GoLang/src/gitlab.com/workonomics/usersapi/cmd/api \; \
    split-window -c /home/daniel -t $SESSION:3.0 -p 80 \; \
    send-keys -t $SESSION:1 vim C-m
