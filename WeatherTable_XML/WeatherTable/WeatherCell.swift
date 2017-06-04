//
//  WeatherCell.swift
//  WeatherTable
//
//  Created by celia me on 2017. 6. 4..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
