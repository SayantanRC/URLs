[Reference](https://www.reddit.com/r/chromeos/comments/9c3wvk/how_do_you_enable_gboard_in_chrome_os/)  

### Drop into shell
1. Open crosh terminal - Alt+Ctrl+T  
2. Enable USB debugging in android.  
3. Type the following commands:  
`shell`  
`adb connect 100.115.92.2`
`adb shell`
### Note the default input method
`settings get secure enabled_input_methods`  
It should be: <b>org.chromium.arc.ime/.ArcInputMethodService</b>  
### Install Gboard from Play Store
See available input methods:  
`ime list -a -s`  
### Set Gboard
`settings put secure enabled_input_methods org.chromium.arc.ime/.ArcInputMethodService:com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME`  
