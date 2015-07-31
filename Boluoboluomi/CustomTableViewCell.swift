//
//  CustomTableViewCell.swift
//  Boluomi
//
//  Created by 李志军 on 15/5/17.
//  Copyright (c) 2015年 lizhijun. All rights reserved.
//

import UIKit
import Gifu

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbImageView: AnimatableImageView! //UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
