# Standalone EFI entry for Chrome OS (brunch)
This is made using an arch linux installation. However I believe this can also be made via a live USB (of Ubuntu or any other distro) without a standalone Linux distro installed.  
#### Current setup:  
1. `/dev/sda1` (or hd0,gpt1)  : The EFI partition on my system. Mounted at `/efi`  
2. `/dev/sda6` : The <b>chromeos.img</b> file is present here. Mounted at `/run/media/$USER/chrome_os`  
#### What I intend to do:
Make a `grubx64.efi` entry under on my EFI partition, i.e. `/efi/EFI/Chrome/grubx64.efi` This will show a standalone entry on my BIOS setup screen to only boot Chrome OS.
## Config file
1. After brunch has finished making the `chromeos.img` file, move it to `/run/media/$USER/chrome_os/chromeos.img`  
2. The following menuentry was propsed by the script:
```
menuentry "ChromeOS (boot from disk image)" {
        img_part=/dev/sda6
        img_path=/chromeos.img
        search --no-floppy --set=root --file $img_path
        loopback loop $img_path
        linux (loop,gpt7)/kernel boot=local noresume noswap loglevel=7 disablevmx=off \
                cros_secure cros_debug loop.max_part=16 img_part=$img_part img_path=$img_path
        initrd (loop,gpt7)/initramfs.img
}

```
Comparing with the above output, make the following `grub.cfg` file in the partition containing chromeos image, i.e at `/run/media/$USER/chrome_os/grub.cfg`  
```
insmod part_gpt
insmod linux
insmod ext2
insmod search
insmod all_video
insmod loopback
insmod cryptodisk

img_part=/dev/sda6
img_path=/chromeos.img
search --no-floppy --set=root --file $img_path
loopback loop $img_path
linux (loop,gpt7)/kernel boot=local noresume noswap loglevel=7 disablevmx=off cros_secure cros_debug loop.max_part=16 img_part=$img_part img_path=$img_path
initrd (loop,gpt7)/initramfs.img

boot
```

## Create efi file
The EFI partition as maounted at `/efi`  
Use the following commands to create a .efi file: `/efi/EFI/Chrome/grubx64.efi`  
```
chrome_part=/run/media/$USER/chrome_os
chrome_efi_rel=EFI/Chrome

sudo mkdir -p /efi/$chrome_efi_rel
sudo grub-mkimage -O x86_64-efi -o /efi/$chrome_efi_rel/grubx64.efi -c $chrome_part/grub.cfg '--prefix=(hd0,gpt1)/$chrome_efi_rel' linux part_gpt ext2 ntfs f2fs fat exfat loopback search all_video echo ls cat disk cryptodisk help loadenv
```

Now you can select the Chrome entry from BIOS screen to boot into Chrome OS.

References:  
[Making GRUB image](https://unix.stackexchange.com/questions/253657/actual-usage-of-grub-mkimage-config)  
[Grub modules](https://www.linux.org/threads/understanding-the-various-grub-modules.11142/)  
