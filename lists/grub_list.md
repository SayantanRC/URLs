# Info
### File paths
Final configuration in `grub.cfg` : /boot/grub/grub.cfg  
Custom GRUB entry in `40_custom` : /etc/grub.d/40_custom  
GRUB options file : /etc/default/grub  

### Troubleshooot
#### GRUB not detecting other linux distributions.  
Set this value in GRUB options file.
```
GRUB_DISABLE_OS_PROBER=false
```
Then run `sudo update-grub`

#### Unknown file system, grub rescue
https://askubuntu.com/questions/142300/how-to-fix-error-unknown-filesystem-grub-rescue  
```
set root=(hdX,Y)  
set prefix=(hdX,Y)/boot/grub  
insmod normal  
normal  
```
Then use `sudo update-grub`  

### Resources
[1. Fix timeout issues](https://gist.github.com/LeahCim/9332432)  
[2. GRUB options customization](https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html)  
[3. Boot from USB using GRUB](https://superuser.com/questions/349633/boot-from-usb-using-grub)  
use ntldr ($root)/bootmgr (not tested) or ntldr /bootmgr (gives an error) after chainloader +1 in case of errors while booting a Windows installation USB.  
[4. Remove GRUB and ubuntu](https://www.youtube.com/watch?v=5Rq4zovHiWk)  
[5. Boot from minimal grub](https://unix.stackexchange.com/questions/418401/grub-error-you-need-to-load-kernel-first)  

[grub-mkimage](https://unix.stackexchange.com/questions/253657/actual-usage-of-grub-mkimage-config)  
[My chrome EFI](https://github.com/SayantanRC/URLs/blob/master/chrome%20os%20standalone%20efi.md)  
[Grub modules](https://www.linux.org/threads/understanding-the-various-grub-modules.11142/)  
[Install / Repair Grub from live USB](https://github.com/SayantanRC/URLs/blob/master/repair-grub-live-usb.md)  
