//
//  ViewController.swift
//  SelectCar
//
//  Created by celia me on 2017. 6. 1..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var carPickerView: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    
    let carCompanyName = ["Tesla", "Lamborghini", "Porsche"]
    var carModel:[String] = []
    var carModelImage:[String] = []
    
    let tesla = ["Model S", "Model X"]
    let lamborghini = ["aventador","veneno", "huracan"]
    let porsche = ["911","boxter"]

    let teslaImageNames = ["tesla-model-s.jpg", "tesla-model-x.jpg"]
    let lamborghiniImageNames = ["lamborghini-aventador.jpg","lamborghini-veneno.jpg", "lamborghini-huracan.jpg"]
    let porscheImageNames = ["porsche-911.jpg","porsche-boxter.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.carPickerView.delegate = self
        self.carPickerView.dataSource = self
        carModel = tesla
        carModelImage = teslaImageNames
        imgView.layer.cornerRadius = 50.0
        imgView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    //datasource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return carCompanyName.count
        } else {
            return carModel.count
        }
    }
    // 컴퍼넌트 몇개 만들지
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    //delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return carCompanyName[row]
        } else {
            return carModel[row]
        }
    }
    //PickerView는 액션이 없고, delegate를 써야함
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (component, row) {
        case (0,0):
            carModel = tesla
            carModelImage = teslaImageNames
        case (0,1):
            carModel = lamborghini
            carModelImage = lamborghiniImageNames
        case (0,2):
            carModel = porsche
            carModelImage = porscheImageNames
        default : ""
        }
        pickerView.reloadAllComponents()
        
        imgView.image = UIImage(named: carModelImage[pickerView.selectedRow(inComponent: 1)])
        
        
    }
}

