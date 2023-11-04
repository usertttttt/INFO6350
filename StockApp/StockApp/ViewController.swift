//
//  ViewController.swift
//  StockApp
//
//  Created by xintao zhang on 10/28/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var stocksArray: [StockClass] = [StockClass]()
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStockValues()
    }
    
    func loadStockValues(){
        do{
            let realm = try Realm()
            let stocks = realm.objects(StockClass.self)
            print(stocks)
            for stock in stocks{
                stocksArray.append(stock)
            }
            tblView.reloadData()
        }catch{
            print("Error in reading from Realm \(error)")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stocksArray.count
            
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let symbol = stocksArray[indexPath.row].symbol
        let price = String(format: "%.2f", stocksArray[indexPath.row].price)
            //cell.textLabel?.text = stocksArray[indexPath.row]
        cell.textLabel?.text = "\(symbol) : \(price)$"
        return cell
        }
}

