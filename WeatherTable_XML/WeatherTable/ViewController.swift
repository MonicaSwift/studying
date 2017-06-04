//
//  ViewController.swift
//  WeatherTable
//
//  Created by celia me on 2017. 6. 3..
//  Copyright © 2017년 celia me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {

    var dataList:[[String:String]] = []
    var detailData:[String:String] = [:]
    var elementTemp:String = ""
    var blank:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseURL = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        parser!.delegate = self
        parser!.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank , elementTemp != "local" , elementTemp != "weatherinfo" {
            detailData[elementTemp] = string
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            dataList += [detailData]
            print(detailData)
        }
        blank = false

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        var dicTemp = dataList[indexPath.row]
        cell.countryLabel.text = dicTemp["country"]
        let weatherStr = dicTemp["weather"]
        cell.weatherLabel.text = weatherStr
        cell.temperatureLabel.text = dicTemp["temperature"]
        
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

