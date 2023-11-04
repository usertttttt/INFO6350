//
//  StockClass.swift
//  StockApp
//
//  Created by xintao zhang on 11/4/23.
//

import Foundation
import RealmSwift

class StockClass: Object{
    @objc dynamic var symbol: String = ""
    @objc dynamic var price: Float = 0.9
    @objc dynamic var companyName: String = ""
    @objc dynamic var desc: String = ""
    
    override static func primaryKey() -> String? {
        return "symbol"
    }
}

