//
//  ViewController.swift
//  FlightBooking
//
//  Created by celia me on 2017. 6. 1..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var selectDatePicker: UIDatePicker!
    @IBOutlet var returnDateButton: UIButton!
    @IBOutlet var returnDateLabel: UILabel!
    @IBOutlet var departureDateButton: UIButton!
    
    var buttonTag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 바탕 눌럿을때 피커랑 키보드 내려가게
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selectDatePicker.isHidden = true
        self.view.endEditing(true)
    }

    @IBAction func showDatePickerAction(_ sender: Any) {
        if selectDatePicker.isHidden {
            selectDatePicker.isHidden = false
        } else {
            selectDatePicker.isHidden = true
        }
        // 어떤 버튼이 눌렷는지 태그로 구분
        buttonTag = (sender as! UIButton).tag
    }
    
    // 날짜 선택했을 때 값을 가져오기
    @IBAction func selectedDateAction(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-d hh:mma"
        //let dateString = formatter.string(from: selectDatePicker.date)
        let dateString = formatter.string(from: (sender as! UIDatePicker).date)
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: UIControlState())
        } else {
            returnDateButton.setTitle(dateString, for: UIControlState())
        }
        
    }
    
    @IBAction func showReturnDateAction(_ sender: Any) {
        print((sender as AnyObject).description) // UISwitch
//        if returnDateButton.isHidden {
//            returnDateButton.isHidden = false
//        } else {
//            returnDateButton.isHidden = true
//        }

//        if (sender as! UISwitch).isOn {
//             returnDateButton.isHidden = false
//        } else {
//            returnDateButton.isHidden = true
//        }
        returnDateLabel.isHidden = !(sender as! UISwitch).isOn
        returnDateButton.isHidden = !(sender as! UISwitch).isOn
    }

}

