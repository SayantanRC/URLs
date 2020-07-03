## Config file
Make the following `grub.cfg` file in the partition containing chromeos image  
```
insmod part_gpt
insmod linux
insmod ext2
insmod search
insmod all_video
insmod loopback
insmod cryptodisk
insmod loadenv

load_env

img_part=/dev/sda6
img_path=/chromeos.img
search --no-floppy --set=root --file $img_path
loopback loop $img_path
linux (loop,gpt7)/kernel boot=local noresume noswap loglevel=7 disablevmx=off cros_secure cros_debug loop.max_part=16 img_part=$img_part img_path=$img_path
initrd (loop,gpt7)/initramfs.img

boot

```

## Create efi file
Mount the EFI partition as `/efi`
```
chrome_part=/run/media/$USER/chrome_os
chrome_efi_rel=EFI/Chrome

sudo mkdir -p /efi/$chrome_efi_rel
sudo grub-mkimage -O x86_64-efi -o /efi/$chrome_efi_rel/grubx64.efi -c $chrome_part/grub.cfg '--prefix=(hd0,gpt1)/$chrome_efi_rel' linux part_gpt ext2 ntfs f2fs fat exfat loopback search all_video echo ls cat disk cryptodisk help loadenv
```

References:  
[Making GRUB image](https://unix.stackexchange.com/questions/253657/actual-usage-of-grub-mkimage-config)  
[Grub modules](https://www.linux.org/threads/understanding-the-various-grub-modules.11142/)  
