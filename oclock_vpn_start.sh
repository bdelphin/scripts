#!/bin/sh
# check if launched as root, and if not, relaunch
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

username="U02F1D4A0TZ"
password="$(/usr/bin/zenity --password --title='VPN Passphrase')"

if [ -z $password ]
then
    DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" sudo -u baptiste -E /usr/bin/notify-send "O'Clock VPN" "No password provided." -u critical
    exit
fi

echo $username > /tmp/pass.txt
echo $password >> /tmp/pass.txt

sh -c 'openvpn --config /home/baptiste/Documents/Oclock/openvpn-client-conf-baptiste-delphin/oclock.ovpn --auth-user-pass /tmp/pass.txt > /var/log/oclock_vpn.log 2>&1 &'

sed -i '1 i\nameserver 192.168.82.1' /etc/resolv.conf

printf "%s" "waiting for remote host ..."

count=0

while ! ping -c 1 -n -w 1 doc.lan &> /dev/null
do
    printf "%c" "."
    ((count=count+1))
    if [ $count = 3 ]
    then
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" sudo -u baptiste -E /usr/bin/notify-send "O'Clock VPN" "Cannot establish VPN connection." -u critical
        sed -i '/nameserver 192.168.82.1/d' /etc/resolv.conf
        exit
    fi
done



printf "\n%s\n"  "VPN connection established !"

rm /tmp/pass.txt

DISPLAY=:0 sudo -u baptiste notify-send "O'Clock VPN" "VPN connection established." -u normal
