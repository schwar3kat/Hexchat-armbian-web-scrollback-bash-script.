# Assumes that you have OpenSSH public key based authentication configured on your windows 10 computer
# Assumes that you have the linux script hexchat-armbian-webscroll.sh in ~/.config/hexchat/scripts/
# Generate the scrollback text #armbian.txt in ~/.config/hexchat/scrollback/liberachat/
# Scp copy the linux computer scrollback text #armbian.txt to the windows computer in C:\Programs\HexChat\config\scrollback\LiberaChat\
# Replace "user@linux_computer" with your own connection details.
# Replace "~/.config/hexchat/scripts/" with the loction of your script on the Linux computer.
# Replace "C:\Programs\HexChat\config\scrollback\LiberaChat\#armbian.txt" with the location of your Windows Hexchat scripts directory.

echo ~/.config/hexchat/scripts/hexchat-armbian-webscroll.sh;exit | ssh -T user@linux_computer
scp user@linux_computer:~/.config/hexchat/scrollback/liberachat/#armbian.txt C:\Programs\HexChat\config\scrollback\LiberaChat\#armbian.txt

exit
