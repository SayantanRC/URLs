### Following code should kill all android processes and allow to restart android apps

1. Open crosh by `Alt` + `Ctrl` + `T`  
2. Enter `shell`  
3. In the green prompt, enter `sudo su`  
4. In the red type the following two commands:  
```
ids=$(ps -ef | awk '$1 ~ /android+/ || $1 ~ /^arc.+$/' | awk '{print $2}')
kill -9 $ids
```

This should kill all android processes including open apps. You may now try starting any app (example: Play Store) to restart the android container.
