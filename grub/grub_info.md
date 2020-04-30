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

### Resources
[Fix timeout issues](https://gist.github.com/LeahCim/9332432)  
[GRUB options customization](https://www.gnu.org/software/grub/manual/grub/html_node/Simple-configuration.html)  
