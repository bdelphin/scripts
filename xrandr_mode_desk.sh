#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please provide the mode to switch to. Candidates are : normal ultrawide center_only"
    exit
fi

if [ "$1" == "normal" ]; then
    xrandr --delmonitor ULTRAWIDE
    xrandr --output DisplayPort-0 --auto --output DisplayPort-2 --left-of DisplayPort-0 --auto --output DisplayPort-1 --right-of DisplayPort-0 --auto
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to normal mode."
fi

if [ "$1" == "ultrawide" ]; then
    xrandr --output DisplayPort-1 --auto --output DisplayPort-2 --left-of DisplayPort-1 --auto --output DisplayPort-0 --right-of DisplayPort-1 --auto
    xrandr --setmonitor ULTRAWIDE auto DisplayPort-2,DisplayPort-1,DisplayPort-0
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to ultrawide."
fi

if [ "$1" == "center_only" ]; then
    xrandr --output DisplayPort-1 --auto --output DisplayPort-2 --off --output DisplayPort-0 --off
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to center_only mode."
fi

i3-msg reload

exec $HOME/.config/polybar/launch.sh

