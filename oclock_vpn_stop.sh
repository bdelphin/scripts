#!/bin/sh
# check if launched as root, and if not, relaunch
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

killall openvpn

sed -i '/nameserver 192.168.82.1/d' /etc/resolv.conf

systemctl restart staticIP

notify-send "O'Clock VPN" "VPN connection down." -u normal
