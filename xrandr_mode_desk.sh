#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Please provide the mode to switch to. Candidates are : normal ultrawide center_only"
    exit
fi

if [ "$1" == "normal" ]; then
    xrandr --output DisplayPort-0 --auto --output HDMI-A-0 --left-of DisplayPort-0 --auto --output DVI-D-0 --right-of DisplayPort-0 --auto
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to normal mode."
fi

if [ "$1" == "ultrawide" ]; then
    xrandr --output DisplayPort-0 --auto --output HDMI-A-0 --left-of DisplayPort-0 --auto --output DVI-D-0 --right-of DisplayPort-0 --auto
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to normal mode."
fi

if [ "$1" == "center_only" ]; then
    xrandr --output DisplayPort-0 --auto --output HDMI-A-0 --off --output DVI-D-0 --off
    notify-send -u normal "XRandR Mode Change !" "XRandR switched to center_only mode."
fi



exec $HOME/.config/polybar/launch.sh

