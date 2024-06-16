#!/bin/bash

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
yes | pkg update && pkg upgrade 2>&1 >/dev/null
echo -e "${R}-> ${NC}Software Update: COMPLETE"
echo -e "\n"
yes | pkg install cronie termux-services libjansson wget nano screen openssh 2>&1 >/dev/null
echo -e "${R}->${NC} Additional Software: ${LG}COMPLETE${NC}"
echo -e "\n"
yes Passw0rd! | passwd u0_a118 2>&1 >/dev/null
echo -e "${R}-> ${NC}Password change: ${LG}COMPLETE${NC}"
echo -e "\n"
sshd 2>&1 >/dev/null
echo -e "${R}-> ${NC}Starting SSHD: ${LG}COMPLETE${NC}"
echo -e "\n"
mkdir ~/.termux/boot && mkdir ~/ccminer && cd ~/ccminer 2>&1 >/dev/null
echo -e "${R}-> ${NC}Creating Miner & Boot Folders: ${LG}COMPLETE${NC}"
echo -e "\n"
wget https://raw.githubusercontent.com/Darktron/pre-compiled/a53/ccminer && wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/start.sh
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/config_luckpool-hybrid.json && mv config_luckpool-hybrid.json config.json
chmod +x ccminer start.sh
cd ~/.termux/boot
wget wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/boot_start
chmod -R 777 ~/.termux/boot
echo -e "${R}-> ${NC}Downloading config: ${LG}COMPLETE${NC}"
echo -e "\n"
cd ~ 2>&1 >/dev/null
rm ncc.sh 2>&1 >/dev/null
wget https://raw.githubusercontent.com/dismaster/ccminer_cfg/main/ncc.sh 2>&1 >/dev/null
chmod 777 ncc.sh 2>&1 >/dev/null
su -c mkdir .cache 2>&1 >/dev/null
su -c chown u0_a179:u0_a179 .cache 2>&1 >/dev/null
su -c chmod 777 .cache 2>&1 >/dev/null
(crontab -l 2>/dev/null; echo "*/5 * * * * ~/ncc.sh") | crontab - 2>&1 >/dev/null
echo -e "${R}-> ${NC}Installing NetworkCheck: ${LG}COMPLETE${NC}"
echo -e "\n"
~/ccminer/start.sh 2>&1 >/dev/null
echo -e "${R}-> ${NC}Starting Miner: ${LG}COMPLETE${NC}"
echo -e "\n"
echo -e "${R}-> ${NC}SETUP: ${LG}COMPLETE${NC}"
echo -e "\n"
