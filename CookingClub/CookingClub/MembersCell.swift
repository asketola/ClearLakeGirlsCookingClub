//
//  MembersCell.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/11/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class MembersCell: UITableViewCell {

    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
