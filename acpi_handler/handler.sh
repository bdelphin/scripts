#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                XAUTHORITY=/home/baptiste/.Xauthority DISPLAY=:0 /home/baptiste/scripts/lockscript/lock -n
		systemctl suspend
		;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
    esac
    ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
