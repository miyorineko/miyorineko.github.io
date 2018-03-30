wget -O "/etc/v2ray/config.json" "https://miyorineko.github.io/tcp-dynport.json"
UUID=$(cat /proc/sys/kernel/random/uuid)
clear
sed -i "s/UserUUID/${UUID}/g" "/etc/v2ray/config.json"
if [[ $? -eq 0 ]];then
	clear
	echo -e "${ok_font}V2Ray UUID Configured."
else
	clear
	echo -e "${error_font}V2Ray UUID Configuration failed！"
	clear_install
	exit 1
fi

clear
vmesslink="vmess://"$(echo -e "{
  \"id\": \"${UUID}\",
  \"aid\": \"100\",
  \"net\": \"tcp\",
  \"type\": \"none\",
  \"host\": \"\",
  \"tls\": \"\"
  }" | base64)
Address=$(curl https://ipinfo.io/ip)
echo -e "Your connection info"
echo -e "IP Addr.:${Address}"
echo -e "UUID:${UUID}"
echo -e "Vmess:${green_backgroundcolor}${vmesslink}${default_fontcolor}"
iptables -A INPUT -p tcp --match multiport --dports 24110:30000 -j ACCEPT
iptables -A INPUT -p udp --match multiport --dports 24110:30000 -j ACCEPT
service v2ray restart
