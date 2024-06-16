echo "Setting up Network Services"
yes | pkg install cronie termux-services
cd ~
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/ncc.sh
chmod 777 ncc.sh
su -c mkdir .cache
su -c chown u0_a179:u0_a179 .cache
su -c chmod 777 .cache
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab -
echo "Installation completed!"
exit
