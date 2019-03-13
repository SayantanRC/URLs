# Get Fyde OS trackpad/touchpad drivers on Chrome os
## Requirements
1. Preferably a separate linux installation (you can use live cd).  
2. Fyde OS img file.  
3. A blank USB drive.  
## How to
1. Burn the Fyde OS image onto USB drive.  
2. Boot linux and mount ROOT-A partitions from Fyde OS USB and actual Chrome OS.  
3. Inside Chrome OS ROOT-A partition rename the `psmouse.ko` file to `psmouse_bak.ko` under `/lib/modules/4.18...` directory  
4. Copy the following files from Fyde OS ROOT-A to Chrome OS ROOT-A:  
`/usr/bin/set-touchpad.sh`  
`/lib/modules/4.18.../psmouse.ko`  
## Set the touchpad
Boot into Chrome OS. Open shell and login as `root`. Issue the following command:
`set-touchpad <option>`  
where option = "imps" or "bare" or "exps" or "auto". You can see the available options in the `set-touchpad.sh` file itself.
