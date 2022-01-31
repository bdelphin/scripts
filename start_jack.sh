#!/bin/bash

jack_control start
jack_control ds alsa
jack_control dps device hw:CODEC
jack_control dps rate 48000
jack_control dps nperiods 4
jack_control dps period 64
sleep 5
#a2j_control --ehw
#a2j_control --start
#sleep 10

# start custom Pulse Audio sink
pactl load-module module-jack-sink client_name=pulse_sink_custom

qjackctl &
jack_mixer -c ~/Music/jack_mixer.xml &
carla ~/Music/carla_rack.carxp &
#sleep 2 && python jack_mixer_cc.py -c ~/Music/jack_mixer.xml &
notify-send "Jack audio server started !"
