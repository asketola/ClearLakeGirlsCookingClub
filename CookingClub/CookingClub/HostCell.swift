//
//  HostCell.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/10/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class HostCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var hostLabel: UILabel!
    @IBOutlet weak var hostPhoneLabel: UILabel!
    @IBOutlet weak var dishLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
