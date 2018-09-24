import json,uuid
with open('/etc/v2ray/config.json') as f:
    data = json.load(f)
data["inbound"]["settings"]["clients"][0]["id"]=str(uuid.uuid4())
json.dumps(data,f)
