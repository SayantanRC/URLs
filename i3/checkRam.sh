#!/bin/bash

free=$(free -mt | grep Total | awk '{print $4}')
echo "$free"
if [[ "$free" -le 100 ]]; then
    # if not enough free, start beeping
    vol=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master))
    vol=${vol:0:2}
    if [[ "$vol" -le 20 ]]; then
        vol="20"
    fi
    amixer -D pulse sset Master playback $vol% unmute
    ( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.5s ; kill -9 $pid
elif [[ "$free" -le 150 ]]; then
    # try killing gradle first
    pkill -f '.*GradleDaemon'
fi
exit 0
