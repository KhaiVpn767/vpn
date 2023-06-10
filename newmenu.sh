#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/KhaiVpn767/access/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/access/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/access/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='XRAY'
bec='xray'
else
rekk='V2RAY'
bec='v2ray'
fi

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\033[1;31mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/access/main/ip | grep $MYIP | awk '{print $3}')
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
cpu_usage+=" %"
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
uptime="$(uptime -p | cut -d " " -f 2-10)"
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /usr/local/etc/xray/domain)
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# TOTAL ACC CREATE VMESS WS
totalvm=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
totalvl=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
fi
chck_b(){
	PID=`ps -ef |grep -v grep | grep scvps_bot |awk '{print $2}'`
	if [[ ! -z "${PID}" ]]; then
			sts="\033[0;32m◉ \033[0m"
		else
			sts="\033[1;31m○ \033[0m"
    fi
}
chck_b
clear
echo -e "                                                                     "
echo -e "\e[31m _                 _______ _________          _______  _       \E[0m"  
echo -e "\e[31m| \    /\|\     /|(  ___  )\__   __/|\     /|(  ____ )( (    /|\E[0m"
echo -e "\e[31m|  \  / /| )   ( || (   ) |   ) (   | )   ( || (    )||  \  ( |\E[0m"
echo -e "\e[31m|  (_/ / | (___) || (___) |   | |   | |   | || (____)||   \ | |\E[0m"
echo -e "\e[31m|   _ (  |  ___  ||  ___  |   | |   ( (   ) )|  _____)| (\ \) |\E[0m"
echo -e "\e[31m|  ( \ \ | (   ) || (   ) |   | |    \ \_/ / | (      | | \   |\E[0m"
echo -e "\e[31m|  /  \ \| )   ( || )   ( |___) (___  \   /  | )      | )  \  |\E[0m"
echo -e "\e[31m|_/    \/|/     \||/     \|\_______/   \_/   |/       |/    )_)\E[0m"
echo -e "                                                                     "
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;30m                 INFO SERVER               \E[0m"
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
serverV=$( curl -sS https://raw.githubusercontent.com/KhaiVpn767/access/main/versi)

if [ "$cekup" = "day" ]; then
echo -e " System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e " System Uptime   : $uphours $upminutes"
fi
echo -e " Ip Vps/Address  : $IPVPS"
echo -e " Domain Name     : $(cat /etc/$bec/domain)"
echo -e " Use Core        : $rekk"
echo -e " Used RAM        : $uram MB"
echo -e " Free RAM        : $fram MB"
echo -e " CPU Usage       : $cpu_usage1 %"
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e  "  \e[33m   Ssh/Ovpn       Vmess        Vless  "
echo -e  " \e[33m       $total_ssh             $totalvm            $totalvl"
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e  "\e[0;33m Traffic\e[0m     \e[0;35mToday     Yesterday    Month   "
echo -e  "\e[0;32m Download\e[0m    $dtoday    $dyest     $dmon   \e[0m"
echo -e  "\e[0;32m Upload\e[0m      $utoday    $uyest     $umon   \e[0m"
echo -e  "\e[0;32m Total\e[0m     \033[0;36m  $ttoday    $tyest     $tmon  \e[0m "
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;30m                 Xray Menu                 \E[0m"
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
echo -e " [\033[1;36m01\033[0m] •\e[0m\033[0;32m SSH & OVPN"
echo -e " [\033[1;36m02\033[0m] •\e[0m\033[0;32m $rekk : VMess / VLess"
echo -e " [\033[1;36m03\033[0m] •\e[0m\033[0;32m TROJAN-GFW & GO"
echo -e " [\033[1;36m04\033[0m] •\e[0m\033[0;32m WIREGUARD"
echo -e " [\033[1;36m05\033[0m] •\e[0m\033[0;32m SSTP"
echo -e " [\033[1;36m06\033[0m] •\e[0m\033[0;32m L2TP / PPTP"
echo -e " [\033[1;36m07\033[0m] •\e[0m\033[0;32m SHADOWSOCKS obfs/ssr"
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e " \e[0;41;30m                System Menu                \e[0m"
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
echo -e " [\033[1;36m55\033[0m] •\e[0m\033[0;32m Trial Generator"
echo -e " [\033[1;36m66\033[0m] •\e[0m\033[0;32m Logs User Created"
echo -e " [\033[1;36m77\033[0m] •\e[0m\033[0;32m VPS Setting [ Menu ]"
echo -e " [\033[1;36m88\033[0m] •\e[0m\033[0;32m Autokill Multi-login [ Menu ]"
echo -e " [\033[1;36m99\033[0m] •\e[0m\033[0;32m ALL Information VPS[ Menu ]"
echo -e ""
echo -e " [\033[1;36m100\033[0m] •\e[0m\033[0;32m SYSTEM / Admin [ Menu ]"
echo -e " [\033[1;36m700\033[0m] •\e[0m\033[0;32m Bot-Panel $sts"

if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -ne
else
echo -e " [\033[0;32m999\033[0m] • \033[0;31mUpdate Available ! Go choice 999 to update\033[0m"
echo ""
fi
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
echo -e "\e[36m╒═══════════════════════════════════════════╕\033[0m"
echo -e "  Version        :\033[1;36m Latest Version\e[0m"
echo -e "  Client Name    : $Name"
echo -e "  Expired Script : $Exp"
echo -e "  \033[0;33mVersion        : Update available to $serverV\e[0m"
echo -e "\e[36m╘═══════════════════════════════════════════╛\033[0m"
echo ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       ssh-menu
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       wg-menu
    elif [[ $x -eq 5 ]]; then
       sstp-menu
    elif [[ $x -eq 6 ]]; then
       ipsec-menu
    elif [[ $x -eq 7 ]]; then
       ss-menu
    elif [[ $x -eq 55 ]]; then
       trial-menu
    elif [[ $x -eq 66 ]]; then
       clear
       cat /etc/log-create-user.log
       read -n 1 -s -r -p "Press any key to back on menu"
       menu
    elif [[ $x -eq 77 ]]; then
       setting-menu
    elif [[ $x -eq 88 ]]; then
       autokill-menu
    elif [[ $x -eq 99 ]]; then
       info-menu
    elif [[ $x -eq 100 ]]; then
       system-menu
    elif [[ $x -eq 700 ]]; then
       installbot
    else
       menu
    fi
else
    if [[ $x -eq 999 ]]; then
       wget -q -O /usr/bin/update-script "https://raw.githubusercontent.com/KhaiVpn767/vpn/main/dll/system/update-script.sh" && chmod +x /usr/bin/update-script
       screen -S upds update-script
       menu
    elif [[ $x -eq 1 ]]; then
       ssh-menu 
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       wg-menu
    elif [[ $x -eq 5 ]]; then
       sstp-menu
    elif [[ $x -eq 6 ]]; then
       ipsec-menu
    elif [[ $x -eq 7 ]]; then
       ss-menu
    elif [[ $x -eq 55 ]]; then
       trial-menu
    elif [[ $x -eq 66 ]]; then
       clear
       cat /etc/log-create-user.log
       read -n 1 -s -r -p "Press any key to back on menu"
       menu
    elif [[ $x -eq 77 ]]; then
       setting-menu 
    elif [[ $x -eq 88 ]]; then
       autokill-menu
    elif [[ $x -eq 99 ]]; then
       info-menu
    elif [[ $x -eq 100 ]]; then
       system-menu
    elif [[ $x -eq 700 ]]; then
       installbot
    else
       menu
    fi
fi
