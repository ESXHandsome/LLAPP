//
//  LLLoginViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/22.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLLoginViewController: LLViewController {
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var underView: UIView!
    @IBOutlet weak var switchBtn: UISegmentedControl!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func loginBtn(_ sender: UIButton) {
        let network = LLNetWorking()
        let user = userName.text
        let pwd = password.text
        if user == ""&&pwd == ""{

        }else{
            let isogin = network.login(user: user!,pwd: pwd!)
            if isogin {
            
            }else{

            }
        }
        
        
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
    
    func resetView(){
        titleLabel.layer.cornerRadius = 10.0
        titleLabel.layer.masksToBounds = true
        titleLabel.text = "小区物业管理系统"
        
        loginBtn.layer.cornerRadius = 10.0
        loginBtn.layer.masksToBounds = true
        loginBtn.titleLabel?.text = "登录"
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
