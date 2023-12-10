//
//  ViewController.swift
//  WeatherApp
//
//  Created by xintao zhang on 12/9/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var weatherValues: [StockClass] = [StockClass]()
    var stockNames = ["SEA","SFO", "PDX", "NYC","MIA"]
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getWeatherValues(_ sender: Any) {
        var stocks = ""
        for stock in stockNames {
            stocks.append("\(stock),")
        }
        let stocksStr = stocks.dropLast()
        let url = "https://us-central1-fir-api-s-8d31b.cloudfunctions.net/app"
        print(url)
        SwiftSpinner.show("Getting Weathers")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print(response.error?.localizedDescription ?? "Error")
                return
            }
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            
            self.weatherValues = [StockClass]()
            for stockJSON in jsonArray {
                print("Weather : \(stockJSON)")
                let cityCode = stockJSON["cityCode"].stringValue
                let city = stockJSON["city"].stringValue
                let temperature = stockJSON["temperature"].intValue
                let conditions = stockJSON["conditions"].stringValue
                
                let stockClass = StockClass()
                stockClass.cityCode = cityCode
                stockClass.city = city
                stockClass.temperature = temperature
                stockClass.conditions = conditions
                self.weatherValues.append(stockClass)
            }
            self.tblView.reloadData()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let city = weatherValues[indexPath.row].city
        let temperature = weatherValues[indexPath.row].temperature
        let conditions = weatherValues[indexPath.row].conditions
        cell.textLabel?.text = "City: \(city) Temperature: \(temperature) Conditions: \(conditions) "
        return cell
    }
    
}
