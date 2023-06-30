# Assumes that you have OpenSSH public key based authentication configured on your windows 10 computer
# Assumes that you have the linux script hexchat-armbian-webscroll.sh in ~/.config/hexchat/scripts/
# Generate the scrollback text #armbian.txt in ~/.config/hexchat/scrollback/liberachat/
# Scp copy the linux computer scrollback text #armbian.txt to the windows computer in C:\Programs\HexChat\config\scrollback\LiberaChat\

echo ~/.config/hexchat/scripts/hexchat-armbian-webscroll.sh;exit | ssh -T user@linux_computer
scp user@linux_computer:~/.config/hexchat/scrollback/liberachat/#armbian.txt C:\Programs\HexChat\config\scrollback\LiberaChat\#armbian.txt

exit
