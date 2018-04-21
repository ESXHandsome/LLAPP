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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://127.0.0.1:8888/measure/water";
        let manager = AFHTTPSessionManager()
        let set = Set<String>(arrayLiteral: "text/html","text/plain","text/json","application/json", "text/javascript")
        manager.responseSerializer.acceptableContentTypes = set
        manager.requestSerializer.timeoutInterval = 30
        manager.get(urlString, parameters: nil, progress: nil, success: { (task, json) in
            print(json!)
        }) { (task, error) in
            print("失败了")
            print(error)
        }
        
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
