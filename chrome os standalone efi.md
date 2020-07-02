## Config file
Make the following `grub.cfg` file in the partition containing chromeos image  
```
insmod part_gpt
insmod linux
insmod ext2
insmod search
insmod all_video
insmod loopback

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
sudo mkdir -p /efi/EFI/Chrome/
sudo grub-mkimage -O x86_64-efi -o /efi/EFI/Chrome/grubx64.efi -c /run/media/sayantan-rc/chrome_os/grub.cfg '--prefix=(hd0,gpt1)/EFI/Chrome' linux part_gpt ext2 ntfs loopback search all_video normal
```
