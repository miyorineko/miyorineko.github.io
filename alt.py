import json,uuid,os
ud=str(uuid.uuid4())
with open('/etc/v2ray/config.json','r+') as f:
    data = json.load(f)
    data["inbound"]["settings"]["clients"][0]["id"]=ud
    f.seek(0)
    json.dump(data,f,indent=4)
print(ud)
os.system('service v2ray restart')
os.system('systemctl restart v2ray')
