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
    echo $1: $status
    exit
fi

echo -e "$1: \e[31m$status\e[0m"
