### Follow these steps

Turn on wifi  
```
nmcli radio wifi on  
```

Search for wifi  
```
wpa_supplicant -h > /dev/null  
nmcli dev wifi rescan  
nmcli dev wifi list  
```

Connect to wifi  
```
nmcli dev wifi connect <SSID> password <password>  
```

Example: `nmcli dev wifi connect TP-LINK_6770 password abcdwxyz`  

### Some useful commands

See the status of radios: `nmcli radio`  
See the status of devices: `nmcli device`  
Turn off wifi: `nmcli radio wifi off`  
