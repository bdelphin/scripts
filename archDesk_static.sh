#!/bin/sh

# Bring interface UP
ip link set enp5s0 up

# Assign IP
ip addr add 192.168.1.13/24 dev enp5s0

# Set GW
ip route add default via 192.168.1.1 dev enp5s0

# Set DNS ?

echo "Network online."
