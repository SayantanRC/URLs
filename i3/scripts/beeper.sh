#!/bin/bash

vol=$(amixer -D pulse sget Master | tail -1 | awk '{print $5}')
vol=${vol:1:2}
if [[ "$vol" == *"%" || "$vol" -le 20 ]]; then
    vol="20"
fi
amixer -D pulse sset Master playback $vol% unmute
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 0.5s ; kill -9 $pid
