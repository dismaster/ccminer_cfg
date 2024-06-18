#!/bin/bash
echo "Setting up Network Services"
yes | pkg install cronie termux-services
cd ~
rm ncc.sh
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/ncc.sh
chmod 777 ncc.sh
mkdir .cache
chmod 777 .cache
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
echo "Installation completed!"
exit
