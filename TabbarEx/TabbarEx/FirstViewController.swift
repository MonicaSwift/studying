//
//  FirstViewController.swift
//  TabbarEx
//
//  Created by celia me on 2017. 6. 3..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        resultLabel.text = "1번 눌림"
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
