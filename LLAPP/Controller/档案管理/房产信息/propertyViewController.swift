//
//  propertyViewController.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/21.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit
import AFNetworking

class propertyViewController: LLViewController {

    var dataSource = [publicModel]()

    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "房产信息"
        regTitleTabMyCell()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let urlString = "http://127.0.0.1:8888/reset_pwd";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        let dic = ["name":""]
        manager.post(urlString, parameters:dic, progress:nil, success: { (task, json) in
            print(json!)
            if let dict = json as? Dictionary<String,Any>{
                let result:String = dict["status"] as! String
                print(result)
                if result == "OK"{
                    self.present(LLRootViewController(), animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "提示", message: "没有这个用户", preferredStyle:.alert)
                    alert.addAction(UIAlertAction(title: "确定", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }else{
                print("json解析失败","请求接口:",urlString,"数据:",json as Any)
            }
        }) { (task, error) in
        }
    }
    
}
extension propertyViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "propertyCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "propertCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "propertCell") as! propertyCell
        cell.owerLbl.text = "小A"
        cell.hourseLbl.text = "大神"
        cell.areaLbl.text = "100"
        cell.deteLbl.text = "2018.04.12"
        //cell颜色为无色
        cell.selectionStyle = .none
        //cell.contentView.backgroundColor = UIColor(hexString: dataSource[indexPath.row].bgcolor!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

