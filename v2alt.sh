UUID=$(cat /proc/sys/kernel/random/uuid)
clear
sed -i "s/UserUUID/${UUID}/g" "/etc/v2ray/config.json"
if [[ $? -eq 0 ]];then
	clear
	echo -e "${ok_font}V2Ray UUID Configured."
  echo -e "${UUID}"
else
	clear
	echo -e "${error_font}V2Ray UUID Configuration failed！"
	clear_install
	exit 1
fi
