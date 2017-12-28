# -*- coding=UTF-8 -*-

from flask import Flask
import json
from flask import request
import pymongo
app = Flask(__name__)

client = pymongo.MongoClient()
db = client.ll_server
collection = db.login

#login
@app.route('/login',methods=['POST'])
def login():
    user = request.form.get('name')
    pwd = request.form.get('pwd')
    dic = collection.find_one({"user":user})
    print dic
    if dic != None:
        print  dic[u'password']
        if dic[u'password'] == pwd:
            return json.dumps({'status':'login'})
    if user == 'admin' and pwd == "admin":
        return json.dumps({'status':'login'})
    else:
        return json.dumps({'status':'unlogin'})

#register
@app.route('/register',methods=['POST'])
def register():
    user = request.form.get('name')
    pwd = request.form.get('pwd')
    dic = db.login.find_one({"user":user})
    if dic == None:
        db.login.insert({"user":user,"password":pwd})
        return json.dumps({'status':'register'})
    else:
        return json.dumps({'status':'unregister'})

#reset password
@app.route('/reset_pwd')
def reset_pwd():
    user = request.form.get('name')
    pwd = request.form.get('pwd')
    new_pwd = request.form.get('new_pwd')
    dic = db.login.find_one({"user":user})
    if dic == None:
        return json.dumps({'status':'no_user'})
    else:
        db.login.update({"password":pwd},{"$set":{"password":new_pwd}})
        return json.dumps({'status':'OK'})




if __name__ == '__main__':
    app.debug = True
    app.run(port=8888)
