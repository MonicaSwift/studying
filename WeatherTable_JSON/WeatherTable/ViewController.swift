//
//  ViewController.swift
//  WeatherTable
//
//  Created by celia me on 2017. 6. 3..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    var datalist:NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseURL = URL(string:"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.json")
        do {
            self.datalist = try JSONSerialization.jsonObject(with: Data(contentsOf:baseURL!), options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        } catch  {
            print("Error loading Data")
        }
        print(self.datalist)
        
        let className = "\(type(of: datalist))" //NSDictionary
        print("className: \(className)")
        let className2 = "\(type(of: datalist["weatherinfo"]))"  //Optional<Any>
        print("className2: \(className2)")
        let className3 = "\(type(of: datalist["weatherinfo"] as! NSDictionary))"  //NSDictionary
        print("className3: \(className3)")
        let className4 = "\(type(of: (datalist["weatherinfo"] as! NSDictionary)["local"]))"  //Optional<Any>
        print("className4: \(className4)")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((datalist["weatherinfo"] as! NSDictionary)["local"] as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let dicTemp = ((datalist["weatherinfo"] as! NSDictionary)["local"] as! NSArray)[indexPath.row] as! NSDictionary
        cell.countryLabel.text = dicTemp["country"] as? String
        let weatherStr = dicTemp["weather"] as? String
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = dicTemp["temperature"] as? String
        
        var imgStr = ""
        switch weatherStr! {
        case "맑음" : imgStr = "sunny.png"
        case "비" : imgStr = "rainy.png"
        case "흐림" : imgStr = "cloudy.png"
        case "눈" : imgStr = "snow.png"
        default : imgStr = "blizzard.png"
        }
        cell.imgView.image = UIImage(named: imgStr)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

