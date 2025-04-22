# Info
### File paths
Final configuration in `grub.cfg` : /boot/grub/grub.cfg  
Custom GRUB entry in `40_custom` : /etc/grub.d/40_custom  
GRUB options file : /etc/default/grub  

### GRUB not detecting other linux distributions.  
Set this value in GRUB options file.
```
GRUB_DISABLE_OS_PROBER=false
```
Then run `sudo update-grub`

### Regenerate / update grub - `update-grub` not available
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
Fedora (https://docs.fedoraproject.org/en-US/quick-docs/grub2-bootloader):  
```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo dnf reinstall grub2-common # optional
```

### Unknown file system / minimal grub, grub rescue
https://askubuntu.com/questions/142300/how-to-fix-error-unknown-filesystem-grub-rescue  
```
set root=(hdX,Y)  
set prefix=(hdX,Y)/boot/grub  
insmod normal  
normal  
```
Then use `sudo update-grub`  

2nd option from [arch linux forum](https://bbs.archlinux.org/viewtopic.php?pid=1915490#p1915490)
```
set root=(hdX,Y)
linux /boot/vmlinuz-linux root=/dev/Y
initrd  /boot/initramfs-linux.img
boot
```

1. `Y` can be `sdaY` or something like `nvme0n1pY`.  
2. The `vmlinuz` part and `initramfs` should be Tab-autocompleted.  
3. The `root` will not be autocompleted.  
4. Note the <b>double space</b> after `initrd`.

### Change GRUB resolution
```
sudo vim /etc/default/grub
```
```
GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_GFXMODE=1920x1200
GRUB_GFXPAYLOAD_LINUX=keep
```
Regenerate grub as defined above.

### Remember last saved option
```
sudo vim /etc/default/grub
```
```
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```
Regenerate grub as defined above.

### Resources
[1. Fix timeout issues](https://gist.github.com/LeahCim/9332432)  
[2. GRUB options customization](https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html)  
[3. Boot from USB using GRUB](https://superuser.com/questions/349633/boot-from-usb-using-grub)  
use ntldr ($root)/bootmgr (not tested) or ntldr /bootmgr (gives an error) after chainloader +1 in case of errors while booting a Windows installation USB.  
[4. Remove GRUB and ubuntu](https://www.youtube.com/watch?v=5Rq4zovHiWk)  
[5. Boot from minimal grub](https://unix.stackexchange.com/questions/418401/grub-error-you-need-to-load-kernel-first)  

### Links
[grub-mkimage](https://unix.stackexchange.com/questions/253657/actual-usage-of-grub-mkimage-config)  
[My chrome EFI](https://github.com/SayantanRC/URLs/blob/master/chrome%20os%20standalone%20efi.md)  
[Grub modules](https://www.linux.org/threads/understanding-the-various-grub-modules.11142/)  
[Install / Repair Grub from live USB](https://github.com/SayantanRC/URLs/blob/master/repair-grub-live-usb.md)  
