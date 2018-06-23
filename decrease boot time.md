## See what is slowing down
Following commands help to get a better insight:  
`systemd-analyze`  
`systemd-analyze blame`  
`systemd-analyze critical-chain`  

## Clean Journal
### Limit journal size:
Edit `/etc/systemd/journald.conf`  
Set this line and value:
> SystemMaxUse=50M

### Clean journal files:
```
cd /var/log/journal/
sudo rm -r *
```

[Information](https://wiki.archlinux.org/index.php/systemd#Journal_size_limit)

## Check keyboard service
https://askubuntu.com/questions/919428/keyboard-setup-service-taking-too-long-in-startup-20sec

## Remove swapfile
Open this file: `/etc/fstab` as sudo.  
Comment out the swapfile line with a `#`

[Information](https://askubuntu.com/questions/625072/deleted-swap-now-boot-takes-forever)  

## Use wicd instead of Network Manager
```
sudo apt remove network-manager
sudo apt install wicd
```

Make sure to include `wicd-gtk -t` in the startup script  

## Mask unnecessary services
Some services like `accounts-daemon.service` are unnecessary at startup. To see which services are enabled, use
```
systemctl list-unit-files --type=service | grep enabled
```
To mask the above mentioned `accounts-daemon.service` service:
```
sudo systemctl mask accounts-daemon.service
```
To unmask and enable:
```
sudo systemctl unmask accounts-daemon.service
sudo systemctl enable accounts-daemon.service
```

Some services which can be masked/disabled are:
- accounts-daemon.service
- ModemManager.service
- keyboard-setup.service
- systemd-journal-flush.service

[Information](https://www.linux.com/learn/cleaning-your-linux-startup-process)
[Much more information](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
