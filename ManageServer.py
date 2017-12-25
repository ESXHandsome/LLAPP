# -*- coding=UTF-8 -*-

from flask import Flask
import json
from flask import request

app = Flask(__name__)

@app.route('/login',methods=['POST'])
def login():
    print "请求网络"
    user = request.form.get('name')
    pwd = request.form.get('pwd')
    if user == 'admin' and pwd == "admin":
        return json.dumps({'status':'login'})
    else:
        return json.dumps({'status':'unlogin'})

@app.route('/')
def hello_name():
    return 'this is name\n'

@app.route('/show')
def show():
    return 'this is show \n'

if __name__ == '__main__':
    app.debug = True
    app.run(port=8888)
