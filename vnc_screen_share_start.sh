#!/bin/bash

# Starts the VNC server for screen-sharing purposes

x11vnc -shared -viewonly -forever -loop -noxdamage -clip 1016x768+2000+100 -padgeom 1016x768 -nocursorshape -cursor most >> /tmp/x11vnc.log 2>&1 &

DISPLAY=:0 notify-send "VNC screenshare started." -u normal
