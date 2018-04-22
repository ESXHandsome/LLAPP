//
//  LLPayViewController.swift
//  LLAPP
//
//  Created by Ying on 2018/1/17.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit

class LLPayViewController: LLViewController {

    @IBAction func 物业事件(_ sender: Any) {
        let vc = userFeeViewController()
        vc.titleString = "物业费费缴纳"
        vc.netString = ""
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBOutlet weak var 供暖: UIButton!
    
    @IBAction func 供暖事件(_ sender: Any) {
        let vc = userFeeViewController()
        vc.titleString = "供暖费缴纳"
        vc.netString = ""
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func 水电事件(_ sender: Any) {
        let vc = userFeeViewController()
        vc.titleString = "水电费费缴纳"
        vc.netString = ""
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBOutlet weak var 水电: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.水电.layer.cornerRadius = 6.0
        self.水电.layer.masksToBounds = true
        self.水电.backgroundColor = UIColor.white
        
        self.供暖.layer.cornerRadius = 6.0
        self.供暖.layer.masksToBounds = true
        self.供暖.backgroundColor = UIColor.white
        
        self.物业.layer.cornerRadius = 6.0
        self.物业.layer.masksToBounds = true
        self.物业.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var 物业: UIButton!
    
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
