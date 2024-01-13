# mac-open-app-finder-and-cleaner
MacOS Opened Apps finder and cleaner 


Lost between so many apps opened in MAC, this little script can help you organise your desktop .


This is a bash script you can use to :

1. Find all Opened Apps in your Mac-OS
1. It will  ask you one by one if you want to keep the app opened or close it
1. To close an app, just hit Enter
1. To keep the app running, hit 'n'

to use
``` macos # bash mac-mac-openapp-cleaner.bash ```

NOTES : 
+ this was tested for BASH script, if you are using zsh, adapt it or switch your shell to BASH
+ there are some stubborn apps , like RoyalTSX , script will try to force close it, you can also open the script and add any app that you see the script has hard time to force close it
+ script will also tell you the stubborn apps that will automatically try to force close them (after you hit Enter)

Example

<img width="762" alt="image" src="https://github.com/abdessamad-elamrani/mac-open-app-finder-and-cleaner/assets/29716902/18e205d1-66b8-4074-a9eb-9398a7771550">
