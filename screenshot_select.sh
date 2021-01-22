#!/bin/bash

now=$(date +"%d-%m-%Y_%H:%M:%S")

mkdir -p /home/baptiste/Images/captures

XAUTHORITY=/home/baptiste/.Xauthority DISPLAY=:0 escrotum -s /home/baptiste/Images/captures/capture_$now.png
