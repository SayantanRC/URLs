# Repair / Install GRUB from live USB

## Requirements
1. Already installed linux partition for which Grub needs to installed repaired.  
2. Patience and some terminal knowledge is helpful.  

## Procedure

Assuming linux is installed in `/dev/sda3`. This will be different for your system. Use Gparted program to check.

1. Boot from the USB drive. Open a terminal with "Alt+Ctrl+T".  
2. Mount the partition.
   ```
   sudo mount /dev/sda3 /mnt
   ```
3. Bind mount some necessary partitions from live USB environment.
   ```
   mount -t proc /proc /mnt/proc/
   mount --rbind /sys /mnt/sys/
   mount --rbind /dev /mnt/dev/
   ```
4. Chroot into the mount point.  
   ```
   sudo chroot /mnt
   ```
5. Now we are in the environment of the actual linux installation. Usually Grub is installed in `/dev/sda1`. Hence we need to mount it.  
   ```
   sudo mount /dev/sda1 /mnt
   ```
   This `/mnt` is different than the one in the previous steps. This one belongs to the actual linux install.  
6. Update grub and install.
   ```
   sudo update-grub
   sudo grub-install --efi-directory=/mnt  /dev/sda
   ```
7. Finally, unmount partitions. In chroot environment:  
   ```
   sudo umount /mnt
   exit
   ```
   In live USB:  
   ```
   sudo umount /mnt/proc
   sudo umount /mnt/sys
   sudo umount /mnt/dev
   sudo umount /mnt
   ```


Reboot and enjoy.
