//
//  LLIdeaViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLIdeaViewController: LLViewController {
    @IBAction func 业主事件(_ sender: Any) {
        self.navigationController?.pushViewController(suggestViewController(), animated: true)

    }
    
    @IBAction func 客户事件(_ sender: Any) {
    }
    @IBOutlet weak var 客户: UIButton!
    
    @IBOutlet weak var 业主: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.客户.layer.cornerRadius = 6.0
        self.客户.layer.masksToBounds = true
        self.客户.backgroundColor = UIColor.white
        
        
        self.业主.layer.cornerRadius = 6.0
        self.业主.layer.masksToBounds = true
        self.业主.backgroundColor = UIColor.white
        
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
