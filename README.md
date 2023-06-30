# Hexchat-armbian-web-scrollback-bash-script.
The hexchat-armbian-webscroll.sh script will replace the IRC scrollback buffer in Hexchat for the #armbian channel with the contents of the logs from irc.armbian.com.

The hexchat-armbian-webscroll-win.cmd script will replace the IRC scrollback buffer in Windows 10 Hexchat for the #armbian channel with the contents of the logs from irc.armbian.com.  It requires a remote Linux computer to run the Linux script located in a directory on the Linux computer.  This method requires OpenSSH public key based authentication to the Linux computer configured on your windows 10 computer.

Note: html2text has more than one version. This script uses the standard debian version that can handle utf-8. 
Developed and tested on Linux Mint 20.2 Xfce, a Debian/Ubuntu 20.04 derivative. The script uses wget, sed, awk, and html2text. 
Modify the for loop to change the number of days to retrieve. For example "for i in {-5..0}" will retrieve the last five days and today.
"joined", "quit", "left" and "known as" lines are excluded. 

If the script is run before joining the #armbian channel, then all retrieved chats from the irc.armbian.com web logs 
will be available to scroll in the Hexchat scroll buffer. Note: the buffer contents are replaced and the old contents are not recoverable.

BSD 2 (simplified) License - feel free to use this for any purpose. There are no guarantees that it will work on your system.
If your system uses different paths or filenames you may need to tweak the script to suit.
K. Schwarz (schwar3kat) 20-03-2022

To auto-run the script on Linux when you open the server on Hexchat, add "/exec /bin/bash ~/.config/hexchat/scripts/hexchat-armbian-webscroll.sh > /dev/null 2>&1" as a server connect command (assuming your script is in ~/.config/hexchat/scripts). Don't autoconnect #armbian, instead add a second server connect command "TIMER 15 JOIN #armbian".  This is to give the script enough time to run.  Tweak the time (seconds).

To auto-run the script on  Windows 10 add EXEC start C:\Programs\HexChat\scripts\hexchat-armbian-webscroll-win.cmd as a server connect command (assuming your script is in C:\Programs\HexChat\scripts. Don't autoconnect #armbian, instead add a second server connect command "TIMER 15 JOIN #armbian".  This is to give the script enough time to run.  Tweak the time (seconds).
