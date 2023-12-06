//
//  ViewController.swift
//  StockAppFinal
//
//  Created by xintao zhang on 12/5/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    var stockValues: [String] = [String]()

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getStockValues(_ sender: Any) {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stockValues.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = stockValues[indexPath.row]
            return cell
        }
}

