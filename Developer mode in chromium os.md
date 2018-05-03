### Requirements
- Chromium os already installed
- A USB drive, bootable with Ubuntu (or any other linux distro)  
  OR, a standalone Ubuntu installation
- Some basic idea about mounting and working in terminal

### Process
#### This will allow opening tty
#### (Alt+Ctrl+F2 from anywhere in chromium os)
1. Boot into Ubuntu
2. Open nautilus or any other file explorer
3. Mount <b>ROOT-A</b> partition
4. Open terminal (Ctrl+Alt+T)
5. <i>cd</i> into <b>ROOT-A</b> mount point.  
  (mount point can be checked from GParted)
6. Copy /etc/shadow file
```
cp /etc/shadow /etc/shadow.bak
```
7. Edit and save the original shadow file:
```
sudo nano /etc/shadow
```
  The contents should be:
  > root:$1$JustRand$Jxi2GaUx7/t2knVdSaAU11:::::::  
  > chronos:$1$JustRand$Jxi2GaUx7/t2knVdSaAU11:::::::  
#### The password is now `<i>password</i>` for both `<i>chronos</i>` and `<i>root</i>`
Boot into chromium os, press Alt+Ctrl+F2 to open tty  
Login as `chronos` with password: `password`  
OR, login as `root` with password: `password`  
Enter <i>logout</i> to close a chronos/root session.  
Press Ctrl+Alt+F1 to get out of tty.  
