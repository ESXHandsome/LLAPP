//
//  userFeeViewController.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/22.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit

class userFeeViewController: LLViewController {
    
    @IBOutlet weak var tabview: UITableView!
    var dataSource = [Any]()
    var titleString : String?
    var netString : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleString
        regTitleTabMyCell()

        // Do any additional setup after loading the view.
    }


}
extension userFeeViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "userFeeCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "userFeeCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return dataSource.count
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userFeeCell") as! userFeeCell
        //        let model = dataSource[indexPath.row] as! Dictionary<String, Any>
        //        cell.owerLbl.text = model["name"] as? String
        //        cell.hourseLbl.text = model["homeID"] as? String
        //        cell.areaLbl.text = model["homeArea"] as? String
        //        cell.deteLbl.text = model["homeDate"] as? String
        
        cell.nameLbl.text = "小明"
        cell.orderIDLbl.text = "订单号9527"
        cell.feeLbl.text = "100"
        
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
