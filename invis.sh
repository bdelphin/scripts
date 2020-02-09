#!/bin/bash
xterm -hold -e "i3-msg floating enable;xdotool getactivewindow windowsize 1 1;transset -i `xdotool getactivewindow` 0.0"