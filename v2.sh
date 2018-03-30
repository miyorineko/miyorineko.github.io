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
echo -e "您的连接信息如下："
echo -e "用户ID(ID)：${UUID}"
echo -e "额外ID(AlterID)：100"
echo -e "加密方式(Security)：aes-128-gcm"
echo -e "传输协议(Network）：tcp"
echo -e "Vmess链接：${green_backgroundcolor}${vmesslink}${default_fontcolor}"
