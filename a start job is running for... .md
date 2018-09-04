Let the job be <X>  
```
systemctl show -p WantedBy,RequiredBy <X>  
```

Let the result give some <Y>.service  
```
sudo systemctl disable <Y>.service  
```

Example:  
`a start job is running for sys-subsystem-net-devices-multi-user.device`  
- Find the service
  `systemctl show -p WantedBy,RequiredBy sys-subsystem-net-devices-multi-user.device`
- Result:  
  ```
  RequiredBy=wpa_supplicant@.service  
  WantedBy=  
  ```
- Disable the service:  
  `sudo systemctl disable wpa_supplicant@.service`
