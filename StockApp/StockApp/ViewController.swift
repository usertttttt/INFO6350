//
//  ViewController.swift
//  StockApp
//
//  Created by xintao zhang on 10/28/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var stocks: [StockClass] = [StockClass]()
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
            
        }catch{
            print("Error in reading from Realm \(error)")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stocks.count
            
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //cell.textLabel?.text = stocks[indexPath.row]
            cell.textLabel?.text = "Ashish"
            return cell
        }
}

