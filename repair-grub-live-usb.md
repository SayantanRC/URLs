# Repair / Install GRUB from live USB

## Requirements
1. Already installed linux partition for which Grub needs to installed or repaired.  
2. Patience and some terminal knowledge is helpful.  

## Procedure

Assuming linux is installed in `/dev/sda3`. This will be different for your system. Use Gparted program to check.

1. Boot from the USB drive. Open a terminal with "Alt+Ctrl+T".  
   ```
   OS="/dev/sda3"
   EFI="/dev/sda1"
   MOUNT="/cdrom"
   ```
2. Mount the partition.
   ```
   sudo mount "$OS" "$MOUNT"
   ```
3. Bind mount some necessary partitions from live USB environment.
   ```
   sudo mount -t proc /proc "${MOUNT}/proc/"
   sudo mount --rbind /sys "${MOUNT}/sys/"
   sudo mount --rbind /dev "${MOUNT}/dev/"
   ```
4. Chroot into the mount point.  
   ```
   sudo chroot "$MOUNT"
   ```
5. Now we are in the environment of the actual linux installation. Usually Grub is installed in `/dev/sda1`. Hence we need to mount it.  
   ```
   sudo mount /dev/sda1 /mnt
   ```
   This `/mnt` is different than the one in the previous steps. This one belongs to the actual linux install.  
6. Update grub and install.
   ```
   sudo grub-install --efi-directory=/mnt  /dev/sda
   # alternative
   # sudo grub-install --target=x86_64-efi --efi-directory=/mnt/ --bootloader-id=<some name>
   ```
7. Finally, unmount partitions. In chroot environment:  
   ```
   sudo umount /mnt
   exit
   ```
   In live USB:  
   ```
   sudo umount "${MOUNT}/proc"
   sudo umount "${MOUNT}/sys"
   sudo umount "${MOUNT}/dev"
   sudo umount "$MOUNT"
   ```


Reboot and enjoy.  

Sources:  
https://unix.stackexchange.com/questions/96977/grub-probe-error-failed-to-get-canonical-path-of-cow  
https://superuser.com/questions/165116/mount-dev-proc-sys-in-a-chroot-environment  
