#!/bin/bash

output=$(i3-msg -t get_outputs | jq '.[] | .name' | dmenu -i)
i3-msg move workspace to output $output
