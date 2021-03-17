# Force developer mode in Chromium (or Chrome) OS

## Requirements
- Chromium os already installed or if you are using [brunch](https://github.com/sebanc/brunch) then the chrome os image should be prepared first.
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

    > For brunch images
  - Navigate to the directory of the image. Here we assume name of image is `chromeos.img`  
  - Create a directory named `ROOT-A` using the command:
     ```
     mkdir ROOT-A
     ```
  - Check the partitions with `fdisk`
     ```
     fdisk -l chromeos.img
     ```
     It should output something like:
     
     <pre>
     Disk chromeos.img: 20 GiB, 21474836480 bytes, 41943040 sectors  
     Units: sectors of 1 * 512 = 512 bytes  
     Sector size (logical/physical): 512 bytes / 512 bytes  
     I/O size (minimum/optimal): 512 bytes / 512 bytes  
     Disklabel type: gpt  
     Disk identifier: D4DC4457-9899-0546-803F-AE325571D176  
       
     Device            Start      End  Sectors  Size       Type  
     chromeos.img1  19255304 41942991 22687688 10.8G Linux filesystem  
     chromeos.img2   2117638  2183173    65536   32M ChromeOS kernel  
     chromeos.img3  10866696 19255303  8388608    4G <b>ChromeOS root fs</b>  
     chromeos.img4   2183174  2248709    65536   32M ChromeOS kernel  
     chromeos.img5   2478088 10866695  8388608    4G <b>ChromeOS root fs</b>  
     chromeos.img6     16448    16448        1  512B ChromeOS kernel  
     chromeos.img7     16456  2113607  2097152    1G ChromeOS root fs  
     chromeos.img8   2248712  2281479    32768   16M Linux filesystem  
     chromeos.img9   2113608  2113608        1  512B ChromeOS reserved  
     chromeos.img10  2113609  2113609        1  512B ChromeOS reserved  
     chromeos.img11       64    16447    16384    8M unknown  
     chromeos.img12  2412552  2478087    65536   32M EFI System  
     
     Partition table entries are not in disk order.  
     </pre>
     
     We are interested in one of the two `4G ChromeOS root fs`


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
Search for "Chrome" and add `cros_debug` in the end of the following line as shown:  
  > linux /boot/vmlinuz-4.14.67 root=/dev/sda7 <b>cros_debug</b>  

This should preferably be in the main menuentry.  
 
 2. Save the file and reboot. Enjoy!
