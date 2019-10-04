#!/usr/bin/env bash

# bdelphin's rofi-power fork
# Use rofi to call systemctl for shutdown, reboot, etc

# This script was forked from Oliver Kraitschy's rofi-power - http://okraits.de

OPTIONS="Reboot system\nPower-off system\nSuspend system\nHibernate system\nLock system\nExit window manager"

LAUNCHER="rofi -theme custom -dmenu -i -p rofi-power:"
USE_LOCKER="true"
LOCKER="$HOME/scripts/lockscript/lock -n"

option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        i3-msg exit
        ;;
      Reboot)
        systemctl reboot
        ;;
      Power-off)
        systemctl poweroff
        ;;
      Suspend)
        $($USE_LOCKER) && "$LOCKER"; systemctl suspend
        ;;
      Hibernate)
        $($USE_LOCKER) && "$LOCKER"; systemctl hibernate
        ;;
      Lock)
	$LOCKER
	;;
      *)
        ;;
    esac
fi
