#!/bin/bash

free=$(free -mt | grep Mem | awk '{print $7}')
echo "RAM: $free"
if [[ "$free" -le 70 ]]; then
    # if not enough free, start beeping
    /home/sayantan/scripts/beeper.sh
fi
if [[ "$free" -le 85 ]]; then
    # try killing chrome/firefox
    killall chrome
    killall firefox
fi
if [[ "$free" -le 100 ]]; then
    # try killing gradle first
    pkill -f '.*GradleDaemon'
fi
exit 0
