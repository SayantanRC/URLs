# Force developer mode in Chromium (or Chrome) OS

## Requirements
- Chromium os already installed
- A USB drive, bootable with Ubuntu (or any other linux distro)  
  OR, a standalone Ubuntu installation
- Some basic idea about mounting and working in terminal

## Processes

### Common steps
1. Boot into Ubuntu
2. Open nautilus or any other file explorer
3. Mount <b>ROOT-A</b> partition
4. Open terminal (Ctrl+Alt+T)

### PROCESS 1. This will set a password for `chronos` and `root`

1. <i>cd</i> into <b>ROOT-A</b> mount point.  
  (mount point can be checked from GParted)  
2. Copy etc/shadow file (just in case you need to revert)
```
sudo cp etc/shadow etc/shadow.bak
```
3. Edit and save the original shadow file:
```
sudo gedit etc/shadow
```
  The contents should be:
  > root:$1$JustRand$Jxi2GaUx7/t2knVdSaAU11:::::::  
  > chronos:$1$JustRand$Jxi2GaUx7/t2knVdSaAU11:::::::  
  
#### The password is now `password` for both `chronos` and `root`
Boot into chromium os, press Alt+Ctrl+F2 to open tty  
Login as `chronos` with password: `password`  
OR, login as `root` with password: `password`  
Enter <i>logout</i> to close a chronos/root session.  
Press Ctrl+Alt+F1 to get out of tty.  

### PROCESS 2. This will allow all developer options




1. Edit the GRUB file in Ubuntu
```
sudo gedit /boot/grub/grub.cfg
```
7. Edit and save the original shadow file:
```
sudo gedit usr/bin/crosh
```
Search for the variable called `CROSH_DEVMODE`. It must be set to ¨1¨ in the first line:  
Initially it would not have any value.  

  > CROSH_DEVMODE=  
  
Change it to:  

  > CROSH_DEVMODE=¨1¨  
  
#### The password is now `password` for both `chronos` and `root`
Boot into chromium os, press Alt+Ctrl+T to open crosh  
Type `shell` to login as `chronos`. No password is needed.  
To login as `root`, first login as `chronos` as in the previous line, then type `sudo su` with password: `password`  
Enter <i>logout</i> to close a `chronos` session, <i>exit</i> to close a `root` session.  
