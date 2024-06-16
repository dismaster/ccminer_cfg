echo "Setting up Network Services"
pkg install cronie termux-services
cd ~
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/ncc.sh
chmod 777 ncc.sh
su
mkdir .cache
chmod 777 .cache
exit
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
echo "Installation completed!"
