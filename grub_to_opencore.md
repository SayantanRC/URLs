# Start OpenCore bootloader from GRUB

Last working on:  
Open core vesion: 0.6.6  
Mac OS version: Big Sur (11.2.1)  

## Arrange the files as below:  
![file_structure](/assets/opencore_grub.png)  
1. Make a directory under `OC`. Here I named "for_grub"  
2. Copy the `OpenCore.efi` file into this directory.  

### Why not delete the original `OpenCore.efi` file? (marked at position 1 in the image)
If you want to boot OpenCore from the BIOS OS boot manager (say, using an EFI file, such option is available in HP laptops) then you would need to select this original file, rather than the copied file.

## Make a custom Grub entry
Under `/etc/grub.d/40_custom` add an entry as below. Do not delete the `exec tail ...` line.  
This entry is according to the above image.  
This is also assuming your hard disk and EFI partition is recognised as `hd0` and `gpt1` respectively.  
```
menuentry 'MacOS' $menuentry_id_option 'macOS-efi' {
	insmod chain
	insmod part_gpt
	insmod fat
	set root=(hd0,gpt1)
	chainloader /efi/Mac/oc/for_grub/OpenCore.efi
	set root=(hd0,gpt1)/efi/Mac
}
```

## Finally update grub
```
sudo update-grub
```

Now a working `MacOS` grub entry should be available.
