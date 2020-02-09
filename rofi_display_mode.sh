#!/bin/bash

echo -e "normal\nextended1080\nextended_4k" | rofi -dmenu -p "display" | xargs $HOME/scripts/xrandr_mode.sh
