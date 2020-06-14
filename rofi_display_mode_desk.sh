#!/bin/bash

echo -e "normal\nultrawide\ncenter_only" | rofi -dmenu -p "display" | xargs $HOME/scripts/xrandr_mode_desk.sh
