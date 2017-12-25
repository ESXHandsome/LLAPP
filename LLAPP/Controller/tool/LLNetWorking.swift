//
//  LLNetWorking.swift
//  LLAPP
//
//  Created by Ying on 2017/12/22.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit
import AFNetworking
class LLNetWorking: NSObject {
    
    func login(user:String,pwd:String) -> Bool {
        let urlString = "http://127.0.0.1:8888/login";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        let dic = ["name":user,"pwd":pwd]
        manager.post(urlString, parameters:dic, progress:nil, success: { (task, json) in
            print(json!)
            if let dict = json as? Dictionary<String,Any>{
                print(dict)
            }else{
                print("json解析失败","请求接口:",urlString,"数据:",json as Any)
            }
        }) { (task, error) in
            
        }
        return true
    }
    
    // MARK: 字典转字符串
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }

    
}
