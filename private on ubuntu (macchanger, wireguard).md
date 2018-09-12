## Make a script file  

```
sudo gedit /usr/local/bin/private-mode.sh
```

Inside paste the contents:  
> #!/bin/bash  
>
> if [ $EUID != 0 ]; then  
>     sudo "$0" "$@"  
>     exit $?  
> fi  
>
> nmcli radio wifi off  
> macchanger -r wlo1>/dev/null  
> nmcli radio wifi on  

#### Make it executable  

```
sudo chmod +x /usr/local/bin/private-mode.sh
```

## Add to `crontab`  

```
sudo crontab -e
```

Add this to the end:  
> @reboot /usr/local/bin/private-mode.sh

## Enable `wireguard` via `systemctl`  

Say we use `azirevpn-us1`:  
```
sudo systemctl enable wg-quick@azirevpn-us1
```
