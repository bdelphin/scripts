#!/bin/bash

tput civis

while [ 1 ]
do
    #clear
    echo -e "\e[31m"
    toilet -f future $(date +%H:%M:%S)
    temp=$(i3-msg -t get_workspaces | jq ".[] | select(.focused==true).name" |     cut -d"\"" -f2)
    echo -n "WS:$temp      $(date +%d/%m/%Y)"
    echo -n -e "\e[m"
    sleep 1
done

