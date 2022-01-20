# Accept Android studio licenses from commandline

1. Open android studio.  
2. Open SDK Manager (`Tools -> SDK Manager`).  
3. Open `SDK Tools` tab.  
4. Enable `Android SDK Command-line Tools` and click Apply.  
5. Open Terminal.  
   ```
   cd ~/Android/Sdk/cmdline-tools
   cd latest/bin
   export JAVA_HOME="$HOME/android-studio/jre/"
   ./sdkmanager --licenses
   ```
   Enter `y` for all the prompts.  
