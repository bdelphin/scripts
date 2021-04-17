#!/bin/bash

echo -e "normal\nultrawide\ncenter_only" | rofi -dmenu -p "display" -theme custom | xargs $HOME/scripts/xrandr_mode_desk.sh
