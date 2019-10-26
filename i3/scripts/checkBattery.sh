#!/bin/bash

state="$(acpi | awk -F ',' '{print $1}' | awk '{print $3}')"
cap="$(cat /sys/class/power_supply/BAT0/capacity)"
echo "Battery: $cap, $state"
if [[ "$cap" -le 8 && "$state" == "Discharging" ]]; then
    # start beeping
    /home/sayantan/scripts/beeper.sh
fi
exit 0