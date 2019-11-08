#!/bin/bash
 
# source wal colors
. "${HOME}/.cache/wal/colors.sh"
 
sed -i '/background = "#/c\background = "'$color1'" ' ${HOME}/.config/dunst/dunstrc
sed -i '/frame_color = "#/c\frame_color = "'$color1'" ' ${HOME}/.config/dunst/dunstrc
sed -i '/foreground = "#/c\foreground = "'$color7'" ' ${HOME}/.config/dunst/dunstrc

