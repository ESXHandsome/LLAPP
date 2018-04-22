//
//  suggestViewController.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/21.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit
import AFNetworking
class suggestViewController: LLViewController {
    
    @IBOutlet weak var tabview: UITableView!
    
    var titleString: String?
    var netString: String?
    var dataSource = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleString
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
extension suggestViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "suggestCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "suggestCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestCell") as! suggestCell
        cell.nameLbl.text = "小明"
        cell.contentLbl.text = "我不介意别人说我还没有长大每天梦想唱歌跳舞 学画画稻田里捕青顺着牵牛花的枝蔓爬到月亮和星星对话"
        //cell颜色为无色
        cell.selectionStyle = .none
        //cell.contentView.backgroundColor = UIColor(hexString: dataSource[indexPath.row].bgcolor!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
