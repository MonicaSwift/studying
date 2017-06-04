//
//  DetailViewController.swift
//  CustomCell
//
//  Created by celia me on 2017. 6. 4..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var detailData = [String:String]()
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
        
        nameLabel.text = detailData["name"]
        amountLabel.text = detailData["amount"]
        valueLabel.text = detailData["value"]
        
        imgView.image = UIImage(named: detailData["image"]!)
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
