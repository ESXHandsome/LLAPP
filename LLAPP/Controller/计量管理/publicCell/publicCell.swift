//
//  publicCell.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/21.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit

class publicCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var View: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.View.layer.masksToBounds = true;
        self.View.layer.cornerRadius = 20;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
