#!/bin/bash

config='config_luckpool-rig3.json'
ssh_passwd='Passw0rd!'

NC='\033[0m'
R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[0;32m'   #'0;32' is Green's ANSI color code
Y='\033[1;33m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code
P='\033[0;35m'
LG='\033[1;32m'
LB='\033[1;34m'
LP='\033[1;35m'
LC='\033[1;36m'

echo -e "${LC}#############################################${NC}"
echo -e "${LC}#             ${LB}VERUS ${LP}Miner ${G}SETUP             ${LC}#${NC}"
echo -e "${LC}#                                           ${LC}#${NC}"
echo -e "${LC}#              v1.0 | by Ch3ckr             ${LC}#${NC}"
echo -e "${LC}#############################################${NC}"

echo -e "\n"
yes | pkg update > /dev/null 2>&1
yes | pkg upgrade > /dev/null 2>&1
echo -e "${R}-> ${NC}Software Update: ${LG}COMPLETE${NC}"
yes | pkg install cronie termux-services libjansson wget nano screen nmap openssh > /dev/null 2>&1
echo -e "${R}->${NC} Additional Software: ${LG}COMPLETE${NC}"
yes ${ssh_passwd} | passwd u0_a118 > /dev/null 2>&1
echo -e "${R}-> ${NC}Password change: ${LG}COMPLETE${NC}"
sshd 2>&1 > /dev/null 2>&1
echo -e "${R}-> ${NC}Starting SSHD: ${LG}COMPLETE${NC}"
mkdir ~/.termux/boot && mkdir ~/ccminer && cd ~/ccminer > /dev/null 2>&1
echo -e "${R}-> ${NC}Creating Miner & Boot Folders: ${LG}COMPLETE${NC}"
wget https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer > /dev/null 2>&1
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/start.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/${config}  > /dev/null 2>&1
mv ${config} config.json > /dev/null 2>&1
chmod +x ccminer start.sh > /dev/null 2>&1
cd ~/.termux/boot > /dev/null 2>&1
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/boot_start > /dev/null 2>&1
chmod -R 777 ~/.termux/boot > /dev/null 2>&1
echo -e "${R}-> ${NC}Downloading config: ${LG}COMPLETE${NC}"
cd ~ > /dev/null 2>&1
rm ncc.sh > /dev/null 2>&1
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/ncc.sh > /dev/null 2>&1
chmod 777 ncc.sh > /dev/null 2>&1
mkdir ~/.cache > /dev/null 2>&1
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab - > /dev/null 2>&1
echo -e "${R}-> ${NC}Installing NetworkCheck: ${LG}COMPLETE${NC}"
~/ccminer/start.sh > /dev/null 2>&1
echo -e "${R}-> ${NC}Starting Miner: ${LG}COMPLETE${NC}"
echo -e "\n"
echo -e "${R}-> ${LB}VERUS ${NC}SETUP: ${LG}COMPLETE ${R}-> REBOOT${NC}"
sleep 5
su -c reboot
