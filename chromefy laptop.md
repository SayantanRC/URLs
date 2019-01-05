[XDA thread](https://forum.xda-developers.com/hardware-hacking/chromebooks/guide-installing-official-chrome-os-pc-t3865697)  

## This guide specifically highlights dual booting Chrome OS with Linux.

### 1. Create partitions using Gparted:
```
ROOT-A : 5 GB : ext2  
STATE : about 30 GB or more : ext4
```
Note down the partition numbers. Example:  
```
ROOT-A : /dev/sda10  
STATE : /dev/sda7
```
### 2. Burn USB drive
Use a fast enough USB drive and burn ArnoldTheBat's chromium image in it using Etcher or any other software.
### 3. Copy files
Mount the ROOT-A and STATE partitions on hard disk and also from the USB drive. Copy all files from ROOT-A of USB drive to ROOT-A of hard disk. Similarly for STATE.
### 4. Download Chrome OS files
From the link to XDA thread, download `chromefy.sh` script, `eve` and `caroline` images. Unpack the zips in the same directory (say ~/Downloads).
### 5. Make a boot entry and copy the respective part.
```
sudo os-prober  
sudo update-grub
```
Note the name of the boot entry of Chrome OS (usually `unknown Linux distribution`)  
```
gedit /boot/grub/grub.cfg
```
Copy the respective menuentry and keep it in a file, in case it is needed later.
### 6. Patch the Chromium OS build
From step-1 see the ROOT-A partition number. For me it was `/dev/sda10`. Substitute it in the following commands as needed.
```
ROOT_PARTITION="/dev/sda10"  
cd </path/to/chromefy+chromeos_images>  
sudo bash ./chromefy.sh $ROOT_PARTITION <chromeos_eve_image.bin> <chromeos_caroline_recovery_image.bin>  
```
<b>Important</b>  
If you are told that the partition was previously mounted and if you would like to continue, hit `n`.
### 7. Edit the partition layout
Go to nautilus (or any other file manager) and mount the ROOT-A partition
```
cd /media/<username>/<name_of_ROOT-A_partition_in_hdd>/usr/sbin  
sudo cp write_gpt.sh write_gpt.sh.bak  
sudo gedit write_gpt.sh
```
Search for `base_vars` and 'partition_vars`. Edit the partition numbers of ROOT-A and STATE from step-1 and remove all other partition information. The size of ROOT-A and STATE need not be altered.  
Save the file and maintain a copy of it.
```
sudo cp /media/<username>/<name_of_ROOT-A_partition_in_hdd>/usr/sbin/write_gpt.sh /home/<username>/
```
### 8. Boot to Chrome OS
Reboot and just boot to `unknown Linux distribution`. Don't sign in. Press "Shutdown" and boot back to Linux.
### 9. Update grub.
```
sudo os-prober
```
If `Chrome` is detected, great. If not edit the file under `/etc/grub.d/40_custom` and paste the backup of the menuentry taken in step-5 at the end of the file.  
Feel free to rename "unknown Linux disribution" to say "Chrome OS".  
Finally update-grub.
```
sudo update-grub
```

### 10. Reboot to Chrome OS and enjoy!
