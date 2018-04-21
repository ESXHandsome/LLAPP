//
//  ViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit
import AFNetworking
//import LLRootViewController
class ViewController: LLViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImageView.init(frame: UIScreen.main.bounds)
        // Do any additional setup after loadin
//        g the view, typically from a nib.
        image.setImageWith(URL.init(string: "https://www.baidu.com/img/bd_logo1.png")!)
        self.view.addSubview(image)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let queue = DispatchQueue(label: "")
        queue.async {
            Thread.sleep(forTimeInterval: 3)
            self.pushViewController()
        }
    }
    
    func pushViewController(){
        let loginViewController = LLLoginViewController()
        DispatchQueue.main.async{
            let nvc = UINavigationController.init(rootViewController: loginViewController)
            self.present(nvc, animated: true, completion: nil)
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

