//
//  ViewController.swift
//  DigitalFrame
//
//  Created by celia me on 2017. 5. 29..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var toggleButton:UIButton!
    @IBOutlet var speedSlider:UISlider!
    @IBOutlet var speedLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let cuteImages = [UIImage(named:"1.jpg")!,
            UIImage(named:"2.jpg")!,
            UIImage(named:"3.jpg")!,
            UIImage(named:"4.jpg")!,
            UIImage(named:"5.jpg")!,
            UIImage(named:"6.jpg")!,
            UIImage(named:"7.jpg")!,
            UIImage(named:"8.jpg")!,
            UIImage(named:"9.jpg")!,
            UIImage(named:"10.jpg")!,
            UIImage(named:"11.jpg")!,
            UIImage(named:"12.jpg")!,
            UIImage(named:"13.jpg")!,
            UIImage(named:"14.jpg")!,
            UIImage(named:"15.jpg")!
        ]
        
        imgView.animationImages = cuteImages
        imgView.animationDuration = 15.0
        //imgView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleAction(_ sender:AnyObject) {
        
        if imgView.isAnimating {
            imgView.stopAnimating()
            toggleButton.setTitle("Start", for: UIControlState.normal)
        } else {
            // animationDuration값이 바뀌면 멈춤, isAnimating값이 false가 됨.
            //imgView.animationDuration = Double(speedSlider.value)
            imgView.startAnimating()
            toggleButton.setTitle("Stop", for: UIControlState.normal)
        }
        
    }
    
    @IBAction func changeSpeedAction(_ sender:AnyObject?) {
        imgView.animationDuration = Double(speedSlider.value)
        imgView.startAnimating()
        toggleButton.setTitle("Stop", for: UIControlState.normal)
        speedLabel.text = "\(speedSlider.value)"
    }

}

