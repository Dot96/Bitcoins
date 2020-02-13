//
//  Coins.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

struct Coins {
    let name: String
    let price: String?
    let number: String?
    
    init?(dict: [String: Any]) {
        guard let Name = dict["name"] as? String,
            let Price = dict["price_usd"] as? String,
            let number = dict["percent_change_1h"] as? String
            else { return nil }
        
        self.name = Name
        self.price = "$ " + Price
        self.number = number
    }
}
