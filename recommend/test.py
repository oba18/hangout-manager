import requests
import json
proxies_dic = {
        "http": "http://proxy.nagaokaut.ac.jp:8080",
        "https": "https//proxy.nagaokaut.ac.jp:8080",
        }
headers_dic = {
        "Content-Type": "application/json"
        }
#  res = requests.get('http://localhost:3000/hang_out/1/get_json')
res = requests.get('http://localhost:3000/hang_out/1/get_json', proxies=proxies_dic, headers=headers_dic)

print (res)
