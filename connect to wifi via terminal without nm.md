# Connect to WPA network without network manager.
## Step 0 - If using NetworkManager
Kill `nm-applet` and `wpa_supplicant`
```
sudo killall nm-applet
sudo killall wpa_supplicant
```
Related NetworkManager processes can be found by `ps -ef | grep nm` or similar
## Step 1 - Turn on the WLAN interface
### Required only for the next step to search networks. If the SSID to connect to is already known, then this step is not needed.
See all the interfaces:
```
ifconfig -a
```
Or:
```
ip link show
```
Interfaces can be like: <b>wlan0</b>, <b>wlo1</b>...  
Turn on the interface using:
```
sudo ifconfig INTERFACE up
```
If successful, the interface will appear in:
```
ifconfig
```
## Step 2 - Search the network
```
sudo iwlist scan # or more specifically: sudo iwlist INTERFACE scan
```
This will provide all the information about surrounding access points. If you need only SSID, try:
```
sudo iwlist scan | grep ESSID
```
## Step 3 - connect to the required SSID
We will connect with `wpa_supplicant`  
Generate the wpa config file with the password.
```
wpa_passphrase "SSID" PASSWORD > wpa.conf
sudo wpa_supplicant -B -i INTERFACE -c wpa.conf
```
If errors like this show up:
> Successfully initialized wpa_supplicant  
> nl80211: Could not set interface 'p2p-dev-wlo1' UP  
> nl80211: deinit ifname=p2p-dev-wlo1 disabled_11b_rates=0  
> p2p-dev-wlo1: Failed to initialize driver interface  
> P2P: Failed to enable P2P Device interface  

Try killing the `wpa_supplicant` processes as mentioned in step 0.
## Step 4 - Start `dhclient`
```
sudo dhclient -r # Release  the  current lease and stop the running DHCP client
sudo dhclient INTERFACE
```
## DONE! Test the connection using `ping`


References:  
https://askubuntu.com/questions/138472/how-do-i-connect-to-a-wpa-wifi-network-using-the-command-line  
https://wiki.archlinux.org/index.php/Network_configuration#Network_managers  
https://bbs.archlinux.org/viewtopic.php?id=213013  
