//
//  proprietorViewController.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/21.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit
import AFNetworking

class proprietorViewController: LLViewController {
    var dataSouce = [Any]()
    @IBOutlet weak var tabview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "业主信息"
        regTitleTabMyCell()
        let urlString = "http://127.0.0.1:8888/file/proprietor";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        manager.get(urlString, parameters: nil, progress: nil, success: { (task, json) in
            if let dict = json as? Dictionary<String,Any>{
                print(dict)
                let array:Array = dict["data"]  as! Array<Any>
                self.dataSouce = array
            }
            DispatchQueue.main.async(execute: {
                self.tabview?.reloadData()
            })
        }) { (task, error) in
            print("失败了")
            print(error)
        }
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
extension proprietorViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "filesCellTableViewCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "filesCellTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSouce.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filesCellTableViewCell") as! filesCellTableViewCell
        let model = dataSouce[indexPath.row] as! Dictionary<String, Any>
        cell.addrLbl.text = model["home"] as? String
        cell.ageLbl.text  = model["age"] as? String
        cell.nameLbl.text = model["name"] as? String
        cell.telLbl.text  = model["tel"] as? String
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

