//
//  ViewController.swift
//  StockAppFinal
//
//  Created by xintao zhang on 12/5/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var stockValues: [StockClass] = [StockClass]()
        
    var stockNames = ["AAPL","MSFT", "META", "GOOG","AMZN"]
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

    @IBAction func getStockValues(_ sender: Any) {
        
            var stocks = ""
            for stock in stockNames {
                stocks.append("\(stock),")
            }
            let stocksStr = stocks.dropLast()
            let url = "\(baseURL)\(stocksStr)?apikey=\(apiKey)"
            print(url)
            SwiftSpinner.show("Getting Stock Values")
            AF.request(url).responseJSON { response in
                SwiftSpinner.hide()
                if response.error != nil {
                    print(response.error?.localizedDescription ?? "Error")
                    return
                }
                guard let rawData = response.data else {return}
                guard let jsonArray = JSON(rawData).array else {return}
                
                self.stockValues = [StockClass]()
                for stockJSON in jsonArray {
                    print("Stock : \(stockJSON)")
                    let symbol = stockJSON["symbol"].stringValue
                    let price = stockJSON["price"].floatValue
                    let volume = stockJSON["volume"].intValue
                    
                    let stockClass = StockClass()
                    stockClass.symbol = symbol
                    stockClass.price = price
                    stockClass.volume = volume
                    self.stockValues.append(stockClass)
                }
                self.tblView.reloadData()
            }
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            stockValues.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let symbol = stockValues[indexPath.row].symbol
            let price = stockValues[indexPath.row].price
            cell.textLabel?.text = "Symbol: \(symbol) Price: \(price)"
            return cell
        }
    }
