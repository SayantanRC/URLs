## 1. Install anbox.
For arch use yay.
```
yay -S aur/anbox-git
```
Then choose the package and wait.

## 2. Try to run anbox. It will probably fail.
```
anbox session-manager
```
Error: `[session_manager.cpp:146@operator()] Failed to start as either binder or ashmem kernel drivers are not loaded`

## 3. Install `linux-headers`
```
sudo pacman -S linux-headers
```
Choose the respective version as per your kernel version.  
At the end you will get output like this:
> (1/3) Arming ConditionNeedsUpdate...  
> (2/3) Updating module dependencies...  
> (3/3) Install DKMS modules  
> ==> dkms install --no-depmod -m anbox-binder -v 1 -k 5.4.85-1-MANJARO  
> ==> dkms install --no-depmod -m anbox-ashmem -v 1 -k 5.4.85-1-MANJARO  
> ==> depmod 5.4.85-1-MANJARO  

## 4. Insert modules.
```
sudo modprobe binder_linux
sudo modprobe ashmem_linux
```

## 5. Start anbox service
```
systemctl start anbox-container-manager.service
```

## 6. Start anbox session
