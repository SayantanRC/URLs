# "This setting is managed by device owner"

### This may permanently damage your Chrome OS installation, or cause problems in future. Proceed with caution and take a backup.
Sometime after updating Chrome OS, some options in settings may get locked out with the label "This setting is managed by the device owner". If you have root access, continue with the guide. If not and you are dual booting, check out [Force developer mode on chromium os](https://github.com/SayantanRC/URLs/blob/master/Developer%20mode%20in%20chromium%20os.md) to see how to edit the `shadow` file to get root access.  

1. Open crosh (Alt+Ctrl+T). Type `shell`. A new green coloured `chronos` prompt appears. Type `sudo su` to get into red coloured `root` shell. Enter password if necessary.  
2. A basic search of the files with "owner" in their name can be done as below. This step is optional, but good to know. It may take a long time.
   ```
   cd /
   find . -type f -iname "*owner*" ! -path "./media/*" ! -path "./run/arc/media/*" ! -path "*android*" 2> /dev/null
   ```
3. The list should have the file: `./mnt/stateful_partition/encrypted/var/lib/whitelist/owner.key`. Go to the file location.
   ```
   cd /mnt/stateful_partition/encrypted/var/lib/whitelist/
   ```
4. Doing an `ls` command lists all the files, including some policy related files. We do not need any of them. Move all of them to some directory. Here we are already logged in as `root` (in red prompt) and we will move them in the root users home. This is just for backup of these files. Hence enter the command:
   ```
   mv * ~/
   ```
5. Proceed with a reboot. Enter:
   ```
   reboot
   ```

After rebooting, new policy files in the above directory should regenerate. Now all the previously locked options in settings should get unlocked.
