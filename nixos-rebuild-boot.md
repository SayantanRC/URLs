Inspired from: https://github.com/SayantanRC/URLs/blob/master/repair-grub-live-usb.md

# Rebuild NixOS bootloader

## Requirements
1. Already installed NixOS partition for which bootloader needs to installed.  
2. Patience and some terminal knowledge is helpful.  

## Procedure

Assuming linux is installed in `/dev/sda3`. This will be different for your system. Use Gparted program to check.

1. Boot from the USB drive. Open a terminal with "Alt+Ctrl+T".  
2. Mount the partition.
   ```
   sudo mkdir -p /cdrom
   sudo mount /dev/sda3 /cdrom
   ```
3. Bind mount some necessary partitions from live USB environment.
   ```
   sudo mount -o bind /dev /cdrom/dev/
   sudo mount -o bind /proc /cdrom/proc/
   sudo mount -o bind /sys /cdrom/sys/
   ```
   We also need to bind mount `resolv.conf` to be able to get internet access in chroot environment.  
   See how to [connect to WiFi using terminal](https://github.com/SayantanRC/URLs/blob/master/Connect%20to%20wifi%20using%20terminal.md) before running this command.
   ```
   sudo mount -o bind /etc/resolv.conf /cdrom/etc/resolv.conf
   ```
5. Chroot into the mount point.  
   ```
   sudo chroot /cdrom /nix/var/nix/profiles/system/activate
   sudo chroot /cdrom /run/current-system/sw/bin/bash
   ```
6. Now we are in the environment of the actual NixOS installation. Usually the bootloader is installed in `/dev/sda1`.  
   Hence we need to mount it. In NixOS we need to mount in under `/boot`.  
   ```
   sudo mount /dev/sda1 /boot
   ```
7. Rebuild NixOS boot.
   ```
   sudo nixos-rebuild boot --option sandbox false
   ```
8. Reinstall bootloader
   ```
   sudo NIXOS_INSTALL_BOOTLOADER=1 /nix/var/nix/profiles/system/bin/switch-to-configuration boot
   ```
10. Finally, unmount partitions. In chroot environment (not all may be successful):  
   ```
   sudo umount /boot
   exit
   ```
   In live USB:  
   ```
   sudo umount /cdrom/proc
   sudo umount /cdrom/sys
   sudo umount /cdrom/dev
   sudo umount /cdrom/etc/resolv.conf
   sudo umount /cdrom
   ```


Reboot and enjoy.  

Sources:  
https://github.com/NixOS/nix/issues/5076#issuecomment-1688038015  
https://nixos.wiki/wiki/Change_root  
https://www.reddit.com/r/NixOS/comments/ouxjzh/how_to_reinstall_bootloader  
