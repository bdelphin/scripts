#!/bin/bash

obs --profile oclock_replay --collection replay --startrecording --minimize-to-tray --multi &

notify-send 'Replay' 'Replay recording started !'
