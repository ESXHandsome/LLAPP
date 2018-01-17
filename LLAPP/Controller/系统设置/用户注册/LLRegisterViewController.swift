//
//  LLRegisterViewController.swift
//  LLAPP
//
//  Created by Ying on 2017/12/28.
//  Copyright © 2017年 Ying. All rights reserved.
//

import UIKit
import AFNetworking
class LLRegisterViewController: LLViewController {


    @IBOutlet weak var passwordTextFeild: UITextField!
    @IBOutlet weak var userTextFeild: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBAction func sendButtonAction(_ sender: Any) {
        let urlString = "http://127.0.0.1:8888/register";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        let dic = ["name":userTextFeild.text,"pwd":passwordTextFeild.text]
        manager.post(urlString, parameters:dic, progress:nil, success: { (task, json) in
            print(json!)
            if let dict = json as? Dictionary<String,Any>{
                let result:String = dict["status"] as! String
                print(result)
                if result == "register"{
                    self.present(LLRootViewController(), animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "提示", message: "用户名已经被注册", preferredStyle:.alert)
                    alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                print("json解析失败","请求接口:",urlString,"数据:",json as Any)
            }
        }) { (task, error) in
        }
    }
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
