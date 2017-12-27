//
//  LLMeasureViewController.swift
//  LLAPP
//
//  Created by lv on 2017/12/21.
//  Copyright © 2017年 lv. All rights reserved.
//

import UIKit

class LLMeasureViewController: LLViewController {
    @IBOutlet weak var gasButton: UIButton!
    
    @IBOutlet weak var energyButton: UIButton!
    @IBOutlet weak var woterButton: UIButton!

    @IBAction func waterButtonAction(_ sender: UIButton) {
        self.present(LLWaterViewController(), animated: true, completion: nil)
    }
    @IBAction func energyButtonAction(_ sender: UIButton) {
        self.present(LLEnergyViewController(), animated: true, completion: nil)
    }
    @IBAction func gasButtonAction(_ sender: UIButton) {
        self.present(LLGasViewController(), animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gasButton.layer.cornerRadius = 6.0
        self.gasButton.layer.masksToBounds = true
        self.gasButton.backgroundColor = UIColor.white
        self.gasButton.titleLabel?.text = "水表统计"
        
        self.woterButton.layer.cornerRadius = 6.0
        self.woterButton.layer.masksToBounds = true
        self.woterButton.backgroundColor = UIColor.white
        self.woterButton.titleLabel?.text = "电表计量"
        
        self.energyButton.layer.cornerRadius = 6.0
        self.energyButton.layer.masksToBounds = true
        self.energyButton.backgroundColor = UIColor.white
        self.energyButton.titleLabel?.text = "天然气计量"
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
