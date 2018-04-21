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
    return json.dumps({'status':'login'})
    # user = request.form.get('name')
    # pwd = request.form.get('pwd')
    # dic = collection.find_one({"user":user})
    # print dic
    # if dic != None:
    #     print  dic[u'password']
    #     if dic[u'password'] == pwd:
    #         return json.dumps({'status':'login'})
    # if user == 'admin' and pwd == "admin":
    #     return json.dumps({'status':'login'})
    # else:
    #     return json.dumps({'status':'unlogin'})

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

@app.route('/measure/water')
def measure_water():
    waterList = []
    message = db.measure_water.find()
    for i in message:
        name = i["name"]
        water = i["water"]
        waterList.append({"name":name,"water":water})
    return json.dumps({"data":waterList})
    # return json.dumps({'status':'OK'})

@app.route('/measure/energy')
def measure_energy():
    energyList = []
    message = db.measure_energy.find()
    for i in message:
        name = i["name"]
        energy = i["energy"]
        energyList.append({"name":name,"energy":energy})
    return json.dumps({"data":energyList})

@app.route('/measure/gas')
def measure_gas():
    gasList = []
    message = db.measure_gas.find()
    for i in message:
        name = i["name"]
        gas = i["gas"]
        gasList.append({"name":name,"gas":gas})
    return json.dumps({"data":gasList})

@app.route('/file/proprietor')
def file_proprietor():
    return 'file_proprietor'

@app.route('/file/property')
def file_property():
    return 'file_property'

@app.route('/equipment/safeguard')
def equipment_safeguard():
    return 'equipment_safeguard'

@app.route('/equipment/clean')
def equipment_clean():
    return 'equipment_clean'

@app.route('/equipment/afforest')
def equipment_afforest():
    return 'equipment_afforest'

@app.route('/equipment/energy')
def equipment_energy():
    return 'equipment_energy'

@app.route('/customer_center/fix')
def customer_center_fix():
    return 'customer_center_fix'

@app.route('/customer_center/phone')
def customer_center_phone():
    return 'customer_center_phone'

@app.route('/customer_center/public_fix')
def customer_center_public_fix():
    return 'customer_center_public_fix'

@app.route('/customer_center/renovate')
def customer_center_renovate():
    return 'customer_center_renovate'

@app.route('/pay/energy')
def pay_energy():
    return 'pay_energy'

@app.route('/pay/gas')
def pay_gas():
    return 'pay_gas'

@app.route('/pay/manage')
def pay_manage():
    return 'pay_manage'

@app.route('/suggest/custom')
def suggest_custom():
    return 'suggest_custom'

@app.route('/suggest/user')
def suggest_user():
    return 'suggest_user'

@app.route('/')
def name():
    return "1"

if __name__ == '__main__':
    app.debug = True
    app.run(port=8888)
