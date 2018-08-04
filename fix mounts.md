### In case of partition resize (ubuntu or efi)...
Ubuntu fails to boot at stage  
`a start job is running for dev-disk-by x2duuid...`  

To resolve, open a terminal (live media or recovery option)  

1. By fixing UUID  
  - Type the following
  ```
  blkid
  ```
  and note the <b>UUID</b> field of the <i>linux partition</i> and <i>EFI partition</i>  
  - Put the correct UUID in fstab
  ```
  nano /etc/fstab
  ```
  Enter the correct UUIDs

2. By removing UUIDs
  - Type the following
  ```
  blkid
  ```
  and note the mount point <b>(/dev/sdaX)</b> field of the <i>linux partition</i> and <i>EFI partition</i>  
  - Remove UUIDs in fstab
  ```
  nano /etc/fstab
  ```
  Remove the UUID and put the mount point. Example:  
  <i>Before</i>
  > UUID=0bf61cd4-2121-4850-a140-13aee96fa632 /               ext4    errors=remount-ro 0       1
  > UUID=DE47-AF92  /boot/efi       vfat    umask=0077      0       1
  <i>After</i>
  > #Comment out the UUIDs
  > #UUID=0bf61cd4-2121-4850-a140-13aee96fa632 /               ext4    errors=remount-ro 0       1
  > /dev/sda5 /               ext4    errors=remount-ro 0       1
  > #UUID=DE47-AF92  /boot/efi       vfat    umask=0077      0       1
  > /dev/sda1  /boot/efi       vfat    umask=0077      0       1
  
