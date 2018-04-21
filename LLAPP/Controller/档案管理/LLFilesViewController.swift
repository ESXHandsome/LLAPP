//
//  LLFilesViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLFilesViewController: LLViewController {
    @IBAction func 业主按钮事件(_ sender: Any) {
        self.navigationController?.pushViewController(proprietorViewController(), animated: true)
        
    }
    

    @IBAction func 房产按钮事件(_ sender: Any) {
        self.navigationController?.pushViewController(propertyViewController(), animated: true)
        
    }
    @IBOutlet weak var 业主: UIButton!
    
    @IBOutlet weak var 房产: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.业主.layer.cornerRadius = 6.0
        self.业主.layer.masksToBounds = true
        self.业主.backgroundColor = UIColor.white
        
        self.房产.layer.cornerRadius = 6.0
        self.房产.layer.masksToBounds = true
        self.房产.backgroundColor = UIColor.white
    
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
