//
//  LLRootViewController.swift
//  LLAPP
//  跟视图控制器
//  Created by lvon 2017/12/22.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLRootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("[LL] 当前的控制器是RootViewController")
        
        //初始化控制器
        let measureViewController = LLMeasureViewController()
        let filesViewController = LLFilesViewController()
        let customerViewController = LLCustomerServiceViewController()
        let userViewController = LLUserViewController()
        let ideaViewController = LLIdeaViewController()
        
        //给控制器设置title
        measureViewController.title = "计量管理"
        filesViewController.title = "档案管理"
        customerViewController.title = "客服管理"
        userViewController.title = "用户管理"
        ideaViewController.title = "意见反馈"
        
        //设置背景
        measureViewController.view.backgroundColor = UIColor.gray
        filesViewController.view.backgroundColor = UIColor.gray
        customerViewController.view.backgroundColor = UIColor.gray
        userViewController.view.backgroundColor = UIColor.gray
        ideaViewController.view.backgroundColor = UIColor.gray
        
        //初始化导航栏控制器
        let measureNVC = UINavigationController.init(rootViewController: measureViewController)
        let filesNVC = UINavigationController.init(rootViewController: filesViewController)
        let customerNVC = UINavigationController.init(rootViewController: customerViewController)
        let userNVC = UINavigationController.init(rootViewController: userViewController)
        let ideaNVC = UINavigationController.init(rootViewController: ideaViewController)
        
        //设置导航栏标题
        measureNVC.tabBarItem.title = "设备管理"
        filesNVC.tabBarItem.title = "档案管理"
        customerNVC.tabBarItem.title = "客服管理"
        userNVC.tabBarItem.title = "用户管理"
        ideaNVC.tabBarItem.title = "意见反馈"
        
        //给标签加上图标
        measureNVC.tabBarItem.image = UIImage.init(named: "")
        filesNVC.tabBarItem.image = UIImage.init(named: "")
        customerNVC.tabBarItem.image = UIImage.init(named: "")
        userNVC.tabBarItem.image = UIImage.init(named: "")
        ideaNVC.tabBarItem.image = UIImage.init(named: "")
        
        //选中图标
        measureNVC.tabBarItem.selectedImage = UIImage.init(named: "")
        filesNVC.tabBarItem.selectedImage = UIImage.init(named: "")
        customerNVC.tabBarItem.selectedImage = UIImage.init(named: "")
        userNVC.tabBarItem.selectedImage = UIImage.init(named: "")
        ideaNVC.tabBarItem.selectedImage = UIImage.init(named: "")
        
        //添加到标签栏控制器
        self.addChildViewController(measureNVC)
        self.addChildViewController(filesNVC)
        self.addChildViewController(customerNVC)
        self.addChildViewController(userNVC)
        self.addChildViewController(ideaNVC)
        
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
