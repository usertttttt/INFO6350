//
//  ViewController.swift
//  MerryChristmas
//
//  Created by xintao zhang on 12/5/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    let cities = ["New York", "London", "Paris", "Seattle"]

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cities.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell =   Bundle.main.loadNibNamed("ChristmasTableViewCell", owner: self)?.first as! ChristmasTableViewCell
            cell.imageView?.image = UIImage(named: "Christmas\(indexPath.row)")
            cell.lblChristmas.text = cities[indexPath.row]
            return cell
        }

    }
