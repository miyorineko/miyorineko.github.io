wget -O "/etc/v2ray/config.json" "https://download.v2ray-install.ml/configs/tcp-dynport.json"
clear
sed -i "s/UserUUID/${UUID}/g" "/etc/v2ray/config.json"
if [[ $? -eq 0 ]];then
	clear
	echo -e "${ok_font}V2Ray UUID配置成功。"
else
	clear
	echo -e "${error_font}V2Ray UUID配置失败！"
	clear_install
	exit 1
fi
