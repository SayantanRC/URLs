#!/bin/bash

free=$(free -mt | grep Total | awk '{print $4}')
echo "$free"
if [[ "$free" -le 100 ]]; then
    # if not enough free, start beeping
    /home/sayantan/scripts/beeper.sh
elif [[ "$free" -le 150 ]]; then
    # try killing gradle first
    pkill -f '.*GradleDaemon'
fi
exit 0
