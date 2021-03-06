//
//  LLWaterViewController.swift
//  LLAPP
//
//  Created by Ying on 2017/12/27.
//  Copyright © 2017年 Ying. All rights reserved.
//

import UIKit
import AFNetworking

class LLWaterViewController: LLViewController {
    
    var dataSource = [Any]()
    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://127.0.0.1:8888/measure/water";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        manager.get(urlString, parameters: nil, progress: nil, success: { (task, json) in
            if let dict = json as? Dictionary<String,Any>{
                let array:Array = dict["data"]  as! Array<Any>
                self.dataSource = array
            }
            DispatchQueue.main.async(execute: {
                self.tabview?.reloadData()
            })
        }) { (task, error) in
            print("失败了")
            print(error)
        }
        
        self.title = "水表计量"
        regTitleTabMyCell()

        // Do any additional setup after loading the view.
    }

}

extension LLWaterViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "publicCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "waterCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "waterCell") as! publicCell
        let model = dataSource[indexPath.row] as! Dictionary<String, Any>
        cell.nameLbl.text = model["name"] as? String
        cell.totalLbl.text = model["water"] as? String
        //cell颜色为无色
        cell.selectionStyle = .none
        //cell.contentView.backgroundColor = UIColor(hexString: dataSource[indexPath.row].bgcolor!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
