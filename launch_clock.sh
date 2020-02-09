#!/bin/bash

i3-msg "workspace 1; append_layout /home/baptiste/.config/i3/ws_clock.json"

urxvt -e sh -c "~/scripts/date.sh; bash"

#exec $HOME/scripts/date.sh
