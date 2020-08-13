from flask import *
import requests
import json
import urllib3

app = Flask(__name__)
http = urllib3.PoolManager()

@app.route("/hangouts/<hang_out_id>")
def get_hangout(hang_out_id):
    url = 'http://web:3000/hang_outs/' + hang_out_id + '/json'
    res = http.request('GET',url)
    return res.data.decode('utf-8')

@app.route("/questions/<question_id>")
def get_question(question_id):
    url = 'http://web:3000/questions/' + question_id + '/json'
    res = http.request('GET',url)
    #  print (res.status)
    question_json = json.loads(res.data.decode('utf-8'))
    print (type(question_json))
    q1 = question_json['q_one']
    q2 = question_json['q_two']
    q3 = question_json['q_three']
    print (type(q1))
    print (q1)
    print (q2)
    print (q3)
    return res.data.decode('utf-8')

## おまじない
if __name__ == "__main__":
    app.run(debug=True)

