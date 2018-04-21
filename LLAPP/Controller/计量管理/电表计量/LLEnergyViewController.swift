//
//  LLEnergyViewController.swift
//  LLAPP
//
//  Created by Ying on 2017/12/27.
//  Copyright © 2017年 Ying. All rights reserved.
//

import UIKit

class LLEnergyViewController: LLViewController {
    
    @IBOutlet weak var tabview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "电表计量"
        regTitleTabMyCell()

        // Do any additional setup after loading the view.
    }


}


extension LLEnergyViewController:UITableViewDelegate,UITableViewDataSource{
    
    //定制的TitleTabcell
    func regTitleTabMyCell() {
        let nib = UINib(nibName: "publicCell", bundle: nil)
        tabview.register(nib, forCellReuseIdentifier: "energyCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "energyCell") as! publicCell
        cell.nameLbl.text = "姓名:小红"
        cell.totalLbl.text = "金额:50"
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
