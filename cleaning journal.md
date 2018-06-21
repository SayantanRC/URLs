### Limit journal size:
Edit `/etc/systemd/journald.conf`  
Set this line and value:
> SystemMaxUse=50M

### Clean journal files:
```
cd /var/log/journal/
sudo rm -rf *
```

[Information](https://wiki.archlinux.org/index.php/systemd#Journal_size_limit)
