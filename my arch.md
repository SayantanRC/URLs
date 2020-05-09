## Installation
Add the following to `pacstrap` command
```
net-tools  
wireless-tools  
wpa_supplicant  
iw  
netctl  
dialog  
```

## Login via tty2 key combo `Ctrl + /`
Create file `/root/login_tty_key.txt`
```
control keycode 53 = Console_2
```
Create file `/etc/systemd/system/key_login.service`:
```
[Unit]  
Description=Script  

[Service]
ExecStart=loadkeys /root/login_tty_key.txt  

[Install]
WantedBy=multi-user.target  
```
Enable the service:
```
sudo systemctl enable key_login.service  
sudo systemctl start key_login.service  
```
References:
https://bbs.archlinux.org/viewtopic.php?id=86815  
https://askubuntu.com/questions/147128/change-default-tty-shortcut  
