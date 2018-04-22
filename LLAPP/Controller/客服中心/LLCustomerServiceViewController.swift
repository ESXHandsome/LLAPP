//
//  LLCustomerServiceViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLCustomerServiceViewController: LLViewController {
    @IBAction func 报修事件(_ sender: Any) {
        
        let vc = customerServiceViewController()
        vc.titleString = "客服保修"
        vc.netString = "http://127.0.0.1:8888/customer_center/fix"
        vc.pubLbl = "报修"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func 电话安装事件(_ sender: Any) {
        let vc = customerServiceViewController()
        vc.titleString = "电话网络安装"
        vc.netString = "http://127.0.0.1:8888/customer_center/phone"
        vc.pubLbl = "网络安装"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func 公共事件(_ sender: Any) {
        let vc = customerServiceViewController()
        vc.titleString = "公共维修"
        vc.netString = "http://127.0.0.1:8888/customer_center/public_fix"
        vc.pubLbl = "公共维修"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func 装修事件(_ sender: Any) {
        let vc = customerServiceViewController()
        vc.titleString = "装修管理"
        vc.netString = "http://127.0.0.1:8888/customer_center/renovate"
        vc.pubLbl = "装修内容"
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBOutlet weak var 装修管理: UIButton!
    @IBOutlet weak var 公共维修: UIButton!
    
    @IBOutlet weak var 电话安装: UIButton!
    @IBOutlet weak var 客户报修: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.装修管理.layer.cornerRadius = 6.0
        self.装修管理.layer.masksToBounds = true
        self.装修管理.backgroundColor = UIColor.white
        
        self.公共维修.layer.cornerRadius = 6.0
        self.公共维修.layer.masksToBounds = true
        self.公共维修.backgroundColor = UIColor.white
        
        self.电话安装.layer.cornerRadius = 6.0
        self.电话安装.layer.masksToBounds = true
        self.电话安装.backgroundColor = UIColor.white
        
        self.客户报修.layer.cornerRadius = 6.0
        self.客户报修.layer.masksToBounds = true
        self.客户报修.backgroundColor = UIColor.white

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
