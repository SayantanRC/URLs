# Crostini fails to start with vmshell error 20
This I found out to be an `sshd` problem. Somehow the systemd service `cros-sftp` of the container was not working.  
All the below steps are from crosh terminal.  

## Start the container from crosh

From crosh terminal (Alt+Ctrl+T):
```
vmc start termina
```
Wait for sometime till the green color prompt comes. Then to list your containers, type `lxc list`. In most cases it is only one container named "penguin", so you can issue the below command:
```
lxc start penguin
```
Finally login to the root shell of the container:
```
lxc exec penguin -- /bin/bash
```
Sources:  
https://superuser.com/questions/1617731/how-to-fix-the-terminal-and-linux-files-for-error-20-on-a-chromebook  
https://www.reddit.com/r/Crostini/comments/cij85h/how_to_login_to_container_from_crosh/  
Login to root without password: https://www.reddit.com/r/Crostini/comments/e8749l/what_is_the_default_password_for_the_initial/  
Extensive material: http://pauldone.blogspot.com/2019/12/my-notes-chromeos-crostini.html  

## Find the problem.
Most problems can be found out by reading the journal, type this to check it `journalctl -xe | more`. Alternately from crosh as well we can check the problems from the file `home/chronos/user/log/chrome` or `var/log/messages`  
Source: https://www.reddit.com/r/Crostini/comments/m0r9dg/quick_tip_more_info_on_crostini_error_codes_is/  
In our case it is known to be a problem of the `cros-sftp` service which is probably dependent on the `sshd` service.  
Check the service:  
```
systemctl status cros-sftp
```
If the service is disabled, enable it.
```
systemctl enable cros-sftp
```
Start the service
```
systemctl start cros-sftp
```

## Failing with `cros-sftp.service: Start request repeated too quickly`
Edit the below file:
```
vim /etc/systemd/system.conf
```
Uncomment the line (remove the starting #): `DefaultStartLimitBurst`. Set the value to a large number like 50.
```
DefaultStartLimitBurst=50
```
Save it. The restart the systemd daemon.
```
systemctl daemon-reload
```
Again try starting the `cros-sftp` service
```
systemctl start cros-sftp
```
Sources:  
https://www.reddit.com/r/Crostini/comments/8p351n/linux_files_mount_error_anyone_else_having/  
https://serverfault.com/questions/845471/service-start-request-repeated-too-quickly-refusing-to-start-limit  

## Fails again with `ExecStartPre=/usr/sbin/sshd -t -f /dev/.ssh/sshd_config (code=exited, status=25`
Try to start the mentioned service manually:
```
/usr/sbin/sshd -t -f /dev/.ssh/sshd_config
```
If it fails with the error `Privilege separation user sshd does not exist` we need to create the sshd user.

## Create `sshd` user if not present.
Source: http://linuxhostingsupport.net/blog/starting-sshd-privilege-separation-user-does-not-exist#:~:text=Starting%20sshd%3A%20Privilege%20separation%20user%20does%20not%20exist,-The%20error%20message&text=It%20indicates%20that%20the%20user,sshd'%20user%20on%20the%20server.&text=If%20it's%20a%20dedicated%20server,in%20before%20the%20problem%20occurred.  
```
vim /etc/passwd
```
Add the line: `sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin` then save and exit.
```
vim /etc/group
```
Add the line: `sshd:x:74:` then save and exit.  
Now try starting the service, it should not complain anymore.  
```
/usr/sbin/sshd -t -f /dev/.ssh/sshd_config
```
Also check the `cros.sftp` service, it should be green.
```
systemctl status cros.sftp
```

## All done, stop the container and start from chrome os terminal.
Press `Ctrl+D` to logout of the container root shell.  
In the green prompt type:
```
lxc stop penguin
```
Press `Ctrl+D` again to logout to yellow crosh shell. Type:
```
vmc stop termina
```
After this the terminal can be closed. Now open the <b>Terminal</b> app from chrome os launcher and all should work fine.
