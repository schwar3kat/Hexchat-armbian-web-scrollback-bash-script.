# /bin/bash
# This script will replace the IRC scrollback buffer in Hexchat for the #armbian channel with the contents of the logs from irc.armbian.com.
# Note: html2text has more than one version. This script uses the standard debian version that can handle utf8. 
# Developed and tested on Linux Mint 20.2 Xfce, a Debian/Ubuntu 20.04 derivative. The script uses wget, sed, awk, and html2text. 
# Modify the for loop to change the number of days to retrieve. For example, "for i in {-5..0}" will retrieve the last five days and today.
# "joined", "quit", "left" and "known as" lines are excluded. 
# If the script is run before joining the #armbian channel, then all retrieved chats from the irc.armbian.com web logs 
# will be available to scroll in the Hexchat scroll buffer. Note: the buffer contents are replaced and the old contents are not recoverable.
# BSD 2 License - feel free to use this for any purpose. There are no guarantees that it will work on your system.
# If your system uses different paths or filenames you may need to tweek the script to suit.
# K. Schwarz (schwar3kat) 20-03-2022

echo ---- start of scrollback imported from irc.armbian.com ---- > ~/.config/hexchat/scrollback/liberachat/#armbian.txt
for i in {-5..0}
do
day=$(date -I -d "$i day")
etime=$(date +%s)

echo "T $etime 19  ---- logs for $day ----" >> ~/.config/hexchat/scrollback/liberachat/#armbian.txt

wget -qO- https://libera.irclog.whitequark.org/armbian/"$day" | html2text -width 1000 -utf8 | sed 's/\&\#x27\;/\x27/g' | sed -n '/Logs: -> irc.armbian.com/,$p' | sed "s/^/$dayT/" | sed '/has quit #armbian\|has quit \[\|has joined #armbian\|has left #armbian\|is now known as\|Logs: -> irc.armbian.com/d' | awk '{
    cmd = "date -d " $1 " +\"%s\""
    if ( (cmd | getline dd) > 0 ) {
        $1 = dd
        $1 = "T " $1 " \x0319*\x0F\t"
    }
    close(cmd)
    print
}' "$1" | tee -a ~/.config/hexchat/scrollback/liberachat/#armbian.txt

done
