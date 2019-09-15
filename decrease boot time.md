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

### Or disable it altogether
See in "Mask unnecessary services" at bottom of this page.

[Information on masking systemd-journal-flush](https://unix.stackexchange.com/questions/414793/can-i-mask-the-systemd-journal-flush-service-and-run-journalctl-flush-later-ma)  
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
- avahi-daemon.service
- pppd-dns.service
- apport.service
- NetworkManager-wait-online.service

[Things to disable/mask](https://www.linux.com/learn/cleaning-your-linux-startup-process)  
[How to disable/enable](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)  
[Information on masking systemd-journal-flush](https://unix.stackexchange.com/questions/414793/can-i-mask-the-systemd-journal-flush-service-and-run-journalctl-flush-later-ma)  

## Use e4rat:
[important step](https://askubuntu.com/questions/260858/help-setting-up-e4rat-no-startup-log-after-e4rat-collect)  
[video](https://www.youtube.com/watch?v=kzuckoHxk_k)  
[wiki](https://wiki.archlinux.org/index.php/e4rat)  

## Delete tmp files:
```
sudo find /tmp/{*,.??*} -exec rm -rf {} \; 
```
[Info](https://askubuntu.com/questions/1167070/systemd-tmpfiles-setup-service-takes-too-long-1hr-on-boot)  

## Disable file system check at every boot
Edit the default grub file:  
```
sudo nano /etc/default/grub
```
Add "fastboot" to the `GRUB_CMDLINE_LINUX_DEFAULT` line. It should look like this:
> GRUB_CMDLINE_LINUX_DEFAULT="fastboot"  

Save the file. Update grub.
```
sudo update-grub
```
