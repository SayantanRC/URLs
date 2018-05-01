Navigate to downloaded location  
```
cd /path/to/iso/images
```

Mount first image  
```
sudo mkdir -p /media/cdrom
sudo mount R2018a_glnxa64_dvd1.iso /media/cdrom/ -o loop
```

Start installation  
```
sudo /media/cdrom/install
```

Select "Use a File Installation key"  
Accept agreement  

Select "I have the file installation key for my license"  
Enter code: 09806-07443-53955-64350-21751-41297  
[code may vary, get the code from: MATLAB R2018a Linux64 Crack.zip -> readme.txt]  

Installation folder (by default): /usr/local/MATLAB/R2018a  

Select the required packages  

<b>On request of DVD2</b>  

Open a new terminal (Alt+Ctrl+t)  
```
sudo umount /media/cdrom
cd /path/to/iso/images
sudo mount R2018a_glnxa64_dvd2.iso /media/cdrom/ -o loop
```
Open the installation window, click "OK" and continue  

Unzip crack zip to a folder named "Crack"  
```
unzip MATLAB\ R2018a\ Linux64\ Crack.zip -d Crack
```

Copy cracked bin directory  
```
sudo cp -r Crack/MATLAB\ R2018a\ Linux64\ Crack/R2018a/bin/ /usr/local/MATLAB/R2018a/
```

Run MATLAB for first time  
```
sudo /usr/local/MATLAB/R2018a/bin/matlab
```

"Activate manually without internet" -> provide full path to Crack\MATLAB R2018a Linux64 Crack\license_standalone.lic  

Run MATLAB (without sudo)  
```
/usr/local/MATLAB/R2018a/bin/matlab
```

#### Enjoy!
