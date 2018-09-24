import json,uuid
with open('/etc/v2ray/config.json','r+') as f:
    data = json.load(f)
    data["inbound"]["settings"]["clients"][0]["id"]=str(uuid.uuid4())
    f.seek(0)
    json.dump(data,f,indent=4)
