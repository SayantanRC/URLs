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
7. Edit the original shadow file:
```
sudo nano /etc/shadow
```
  The contents should be:
  > root:
