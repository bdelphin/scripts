#!/bin/bash

# source wal colors
. "${HOME}/.cache/wal/colors.sh"

sed -i '/walgen: #/c\    walgen: '$color1';' ${HOME}/.config/rofi/custom.rasi
