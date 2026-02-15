❗ Instructions meant for Intel CPUs. [source](https://wiki.archlinux.org/title/Power_management)  
❗ This will disable switching performance mode and keep the system on `balance_power` always.

1. Disable `power-profiles-daemon`
   ```
   sudo systemctl stop power-profiles-daemon
   sudo systemctl mask power-profiles-daemon
   ```
2. Create file under `/etc/tmpfiles.d`
   ```
   sudo vim /etc/tmpfiles.d/energy_performance_preference.conf
   ```
   Enter the following (will keep the system in `balance_power` always):
   
   > w /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference - - - - balance_power
4. Run the following to immediately take effect
   ```
   sudo systemd-tmpfiles --create
   ```
5. Reboot
