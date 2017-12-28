//
//  LLLoginViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/22.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit
import AFNetworking
class LLLoginViewController: LLViewController {
    @IBAction func resetPwdAction(_ sender: Any) {
        self.navigationController?.pushViewController(LLResetViewController(), animated: true)
    }
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var underView: UIView!
    @IBOutlet weak var switchBtn: UISegmentedControl!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func loginBtn(_ sender: UIButton) {
        let user = userName.text
        let pwd = password.text
        if user == ""||pwd == ""{
            let alert = UIAlertController(title: "提示", message: "用户名或密码为空", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            self.login(user: user!,pwd: pwd!)
        }
    }
    @IBAction func registerButtonAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(LLRegisterViewController(), animated: true)
    }
    @IBAction func switchBtn(_ sender: UISegmentedControl) {
        
    }
    @IBOutlet weak var passworldLabel: UITextField!
    @IBOutlet weak var userLabel: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    
//    @IBOutlet weak var underView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //重构视图
        resetView()
        
        //注册键盘呼出通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(note:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        //注册键盘消失通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHidden(note:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    //键盘出现上移view
    @objc func keyboardWillShow(note: NSNotification) {
        underView.center = CGPoint.init(x: underView.center.x, y: 200)
        
    }
    //键盘消失恢复view
    @objc func keyboardWillHidden(note: NSNotification) {
        underView.center = CGPoint.init(x: underView.center.x, y: 521)

    }
    
    //点击其他地方砍掉键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        userLabel.resignFirstResponder()
        passworldLabel.resignFirstResponder()
    }
    
    //设置视图圆角
    func resetView(){
        titleLabel.layer.cornerRadius = 10.0
        titleLabel.layer.masksToBounds = true
        titleLabel.text = "小区物业管理系统"
        
        loginBtn.layer.cornerRadius = 10.0
        loginBtn.layer.masksToBounds = true
        loginBtn.titleLabel?.text = "登录"
    }
    
    //登录逻辑
    func login(user:String,pwd:String) -> Void {
        let urlString = "http://127.0.0.1:8888/login";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        let dic = ["name":user,"pwd":pwd]
        manager.post(urlString, parameters:dic, progress:nil, success: { (task, json) in
            print(json!)
            if let dict = json as? Dictionary<String,Any>{
                let result:String = dict["status"] as! String
                print(result)
                if result == "login"{
                    self.present(LLRootViewController(), animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "提示", message: "用户名或密码错误", preferredStyle:.alert)
                    alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                print("json解析失败","请求接口:",urlString,"数据:",json as Any)
            }
        }) { (task, error) in
        }
        
    }
    
    // MARK: 字典转字符串
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
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
