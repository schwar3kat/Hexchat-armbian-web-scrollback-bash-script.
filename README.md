# Hexchat-armbian-web-scrollback-bash-script.
This script will replace the IRC scrollback buffer in Hexchat for the #armbian channel with the contents of the logs from irc.armbian.com.

Note: html2text has more than one version. This script uses the standard debian version that can handle utf8. 
Developed and tested on Linux Mint 20.2 Xfce, a Debian/Ubuntu 20.04 derivative. The script uses wget, sed, awk, and html2text. 
Modify the for loop to change the number of days to retrieve. For example "for i in {-5..0}" will retrieve the last five days and today.
"joined", "quit", "left" and "known as" lines are excluded. 

If the script is run before joining the #armbian channel, then all retrieved chats from the irc.armbian.com web logs 
will be available to scroll in the Hexchat scroll buffer. Note: the buffer contents are replaced and the old contents are not recoverable.

BSD 2 (simplified) License - feel free to use this for any purpose. There are no guarantees that it will work on your system.
If your system uses different paths or filenames you may need to tweak the script to suit.
K. Schwarz (schwar3kat) 20-03-2022

To auto-run the script when you open the server, add "/exec /bin/bash ~/.config/hexchat/scripts/hexchat-armbian-webscroll.sh > /dev/null 2>&1" as a server connect command (assuming your script is in ~/.config/hexchat/scripts). Don't autoconnect #armbian, instead add a server connect command "TIMER 15 JOIN #armbian".  This is to give the script enough time to run.  Tweak the time (seconds).
