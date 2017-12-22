//
//  ViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit
//import LLRootViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        // Do any additional setup after loading the view, typically from a nib.
        let queue = DispatchQueue(label: "")
        queue.async {
            Thread.sleep(forTimeInterval: 3)
            self.pushViewController()
        }
        
    }
    
    func pushViewController(){
        let loginViewController = LLLoginViewController()
        DispatchQueue.main.async{
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        let viewController = LLRootViewController()
        //        self.present(viewController, animated:true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

