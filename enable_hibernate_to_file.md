# Linux hibernate to file

### Create a swapfile
```
cd /var
touch swapfile                                                            
chmod 600 swapfile
mkswap /var/swapfile
```

### Enable swap file and add to fstab
```
swapon /var/swapfile
```
Add the below line to `/etc/fstab`
```
/var/swapfile    none    swap    sw    0   0
```

### Regenerate initramfs
Edit the file `/etc/mkinitcpio.conf`. Add `resume` to HOOKS line if not present.
```
HOOKS=(base udev autodetect modconf block filesystems resume keyboard)
```
Regenerate initramfs
```
mkinitcpio -P
```

### Find swap partition and swap offset
 - swap partition: `findmnt -T /var/swapfile | tail -1 | awk '{print $2}'`  
 - swap offset: `filefrag -v /var/swapfile | awk '{ if($1=="0:"){print $4} }'`  
(source)[https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate]  

## Add kenrel parameter in GRUB
Edit the file `/etc/default/grub` with the swap partition and swap offset.  
Example:
```
GRUB_CMDLINE_LINUX="resume=/dev/sda5 resume_offset=286720.."
```

### Update grub
```
sudo update-grub
```

## Finally put to hibernation
```
systemctl hibernate
```
