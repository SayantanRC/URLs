# Linux hibernate to file

### Remove an old swapfile
Assuming an old swapfile of 1.5 GB is present under `/swapfile`
```
sudo swapoff /swapfile
sudo rm /swapfile
```
**Update `/etc/fstab` to comment out old swapfile.**

### Create a swapfile
Here we create a 9 GB swap file.
```
cd /var
touch swapfile
chmod 600 swapfile
dd if=/dev/zero of=/var/swapfile bs=1024k count=9000 status=progress
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

### Find swap partition and swap offset
 - swap partition: `findmnt -T /var/swapfile | tail -1 | awk '{print $2}'`  
 - swap offset: `filefrag -v /var/swapfile | awk '{ if($1=="0:"){print $4} }'`. **Do not consider ending ".." in the swap offset.**  
[source](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate)  
 - swap file UUID: `findmnt -no UUID -T /var/swapfile`  

### Regenerate initramfs
If the file `/etc/mkinitcpio.conf` exists, add `resume` to HOOKS line if not present.
```
HOOKS=(base udev autodetect modconf block filesystems resume keyboard)
```

If the above file does not exist (for ubuntu systems), create / edit the file `/etc/initramfs-tools/conf.d/resume`.  
Add the below line:  
```
RESUME=UUID=swap_file_UUID resume_offset=swap_offset
```
Example: `RESUME=UUID=f5a04583-faa6-420f-add1-d4044f35938b resume_offset=3471360`

Regenerate initramfs
```
mkinitcpio -P
```

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

### Troubleshoot
1. You may need to add major:minor in `/sys/power/resume`. Example:
```
~ >>> cat /sys/power/resume
8:2
```
This can be obtained from `lsblk`. Regenerate initramfs by `mkinitcpio -P`. Then reboot.  
2. To hibernate to a partition, edit the kernel parameter as below example:
```
GRUB_CMDLINE_LINUX="resume=\"PARTLABEL=manjaro_swap\""
```
Update grub by `update-grub` and reboot.  

Sources:  
https://www.youtube.com/watch?v=Xek3TGKzLWw&t  
https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate  
https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation  
https://www.computernetworkingnotes.com/linux-tutorials/shutdown-reboot-suspend-and-hibernate-a-linux-system.html  
https://www.howtogeek.com/455981/how-to-create-a-swap-file-on-linux/  
