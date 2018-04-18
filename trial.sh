#!/bin/bash
#Script auto create trial user SSH
#yg akan expired setelah 1 hari
#modified by IRTech Network

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "====Trial SSH Account====" | lolcat
echo -e "Host: $IP"
echo -e "Username: $Login"
echo -e "Password: $Pass\n"
echo -e "Port SSL: 443"
echo -e "Config OpenVPN (TCP 1194): http://$IP/client.ovpn"
echo -e "-----------------------------" | lolcat
echo -e "Aktif Sampai: $exp"
echo -e "=============================" | lolcat
echo -e "Mod by IRTech Network"
echo -e ""
