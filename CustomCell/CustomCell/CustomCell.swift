//
//  CustomCell.swift
//  CustomCell
//
//  Created by celia me on 2017. 6. 3..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.contentMode = UIViewContentMode.scaleAspectFill
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
