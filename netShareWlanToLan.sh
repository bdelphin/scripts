#!/bin/bash

# W2L
# A small script to share WLAN to LAN.
# Credit : Baptiste DELPHIN (github.com/bdelphin) 2019
# Licence : GNU GPLv3

# Setup :

# Configure your net interfaces :
lan='enp4s0'
wlan='wlp5s0'

# Don't change that (or change /etc/dhcpd.conf accordingly, or wait for autosetup to be implemented - hope you'r not in a hurry)
lan_ip='192.168.42.1/24'
subnet='192.168.42.0/24'
# Copy this script to /usr/bin (sudo cp w2l /usr/bin/)
# And you'r good to go ! Just type sudo w2l to launch. Crtl+C to stop.




# Don't touch below.

# TODO : autosetup
# detect net interfaces ?
# detect if arch of debian based
# install dhcp package according to distro
# configure dhcp to listen only to one interface

# set fixed IP address on lan interface
ip link set up dev $lan
ip addr add $lan_ip dev $lan

#activate IP Forward
sysctl net.ipv4.ip_forward=1

# Firewall rules
iptables -t nat -A POSTROUTING -s $subnet -o $wlan -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $lan -o $wlan -j ACCEPT
iptables -I INPUT -p udp --dport 67 -i $lan -j ACCEPT
iptables -I INPUT -p udp --dport 53 -i $lan -j ACCEPT
iptables -I INPUT -p tcp --dport 53 -i $lan -j ACCEPT

# DCHP Service enabling
service_name='dhcpd4@'$lan
systemctl start $service_name

echo "Running, press Ctrl+C to stop."
while [ 1 ]
do
	sleep 1
done
echo "Exiting ..."
systemctl stop $service_name
