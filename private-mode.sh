#!/bin/bash

# sudo gedit /usr/local/bin/private-mode.sh
# chown +x /usr/local/bin/private-mode.sh

# sudo crontab -e
## Add this to the end:
# @reboot /usr/local/bin/private-mode.sh

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

nmcli radio wifi off
macchanger -r wlo1>/dev/null
nmcli radio wifi on
    
wg-quick up azirevpn-us1 2>/dev/null || :
