#!/bin/bash

if [ -z "$1" ]
  then
    echo "Error, please input service to check."
    exit
fi

status=$(systemctl is-active $1)
#status=$(systemctl status $1 | grep Active | cut -d' ' -f6 | sed "s/(//" | sed "s/)//")

if [ "$status" == "active" ];
then
    echo $status
    exit
fi

echo -e "\e[31m$status\e[0m"
