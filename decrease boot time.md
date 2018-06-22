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
