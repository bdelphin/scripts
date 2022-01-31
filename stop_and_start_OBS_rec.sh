#!/bin/bash

notify-send 'Replay' 'Stopping replay ...'

obs-cli --port 4321 --password agbdlcid recording stop

sleep 5

obs-cli --port 4321 --password agbdlcid recording start

notify-send 'Replay' 'Replay restarted !'
