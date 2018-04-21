//
//  propertyCell.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/21.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit

class propertyCell: UITableViewCell {

    @IBOutlet weak var VIew: UIView!
    
    @IBOutlet weak var owerLbl: UILabel!
    
    @IBOutlet weak var hourseLbl: UILabel!
    
    @IBOutlet weak var areaLbl: UILabel!
    
    @IBOutlet weak var deteLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.VIew.layer.masksToBounds = true;
        self.VIew.layer.cornerRadius = 20;

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
