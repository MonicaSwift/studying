//
//  ViewController.swift
//  VendingMachine
//
//  Created by celia me on 2017. 5. 19..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputMoney: UITextField!
    @IBOutlet weak var inputChages: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var cntDrink1: UILabel!
    @IBOutlet weak var cntDrink2: UILabel!
    @IBOutlet weak var cntDrink3: UILabel!
    
    var arrDrink:Array<Drink> = [Drink(name:"bargs",cost:500), Drink(name:"pibb", cost:1500), Drink(name:"zero", cost:1000)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        struct Dog:CustomStringConvertible {
            var name:String
            var description: String {
                return "\(self.name)"
            }
        }
        let dog = Dog(name:"aa")
        print(String(describing: dog))

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func plusDrink(_ sender: UIButton) {
        
        let btnNum:Int = sender.tag
        
        switch btnNum {
        case 0 :
            arrDrink.append(Drink(name: "bargs", cost: 500))
            cntDrink1.text = "\(Int(cntDrink1.text!)! + 1)"
        case 1 :
            arrDrink.append(Drink(name: "pibb", cost: 1500))
            cntDrink2.text = "\(Int(cntDrink2.text!)! + 1)"
        case 2 :
            arrDrink.append(Drink(name: "zero", cost: 1000))
            cntDrink3.text = "\(Int(cntDrink3.text!)! + 1)"
        default :
            ""
        }
        
    
    }
    
    @IBAction func clickDrink(_ sender: UIButton) {
/*
        for (index, value) in arrDrink.enumerated() {            if String(index) == sender.currentTitle {
                self.labelMessage.text = "\(value.name)이 나옵니다"
                let result:Int =  Int(self.inputChages.text!)! - value.cost
                self.inputChages.text = String(result)
            }
        }
*/
        var flgSoldout:Bool = true
        for (index,value) in arrDrink.enumerated() {
            if value.name == sender.currentTitle {
                
                let result:Int =  Int(self.inputChages.text!)! - value.cost
                self.inputChages.text = String(result)
                
                switch value.name {
                case "bargs" :
                    cntDrink1.text = "\(Int(cntDrink1.text!)! - 1)"
                case "pibb" :
                    cntDrink2.text = "\(Int(cntDrink2.text!)! - 1)"
                case "zero" :
                    cntDrink3.text = "\(Int(cntDrink3.text!)! - 1)"
                default :
                    ""
                }
                
                self.labelMessage.text = "\(value.name)이 나옵니다"
                arrDrink.remove(at: index)
                flgSoldout = false
                break
            }
        }
        if flgSoldout {
            self.labelMessage.text = "\(sender.currentTitle!)이 품절입니다"
        }
    }
    
    @IBAction func insertCoin(_ sender: UIButton) {
        self.inputChages.text = self.inputMoney.text
        self.inputMoney.text = "0"
    }

    @IBAction func retrunMoney(_ sender: UIButton) {
        self.inputMoney.text = "0"
        self.inputChages.text = "0"
    }


}

