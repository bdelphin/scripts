#!/bin/bash

# source wal colors
. "${HOME}/.cache/wal/colors.sh"

echo $color1

sed -i '/--bg-color:/c\--bg-color: '$color1';' ${HOME}/.mozilla/firefox/ifajf7uc.default-release/chrome/userChrome.css
