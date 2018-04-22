//
//  suggestCell.swift
//  LLAPP
//
//  Created by 贾文鹏 on 2018/4/22.
//  Copyright © 2018年 Ying. All rights reserved.
//

import UIKit

class suggestCell: UITableViewCell {
    
    
    @IBOutlet weak var View: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.View.layer.masksToBounds = true;
        self.View.layer.cornerRadius = 20;    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
