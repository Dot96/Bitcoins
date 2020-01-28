//
//  CoinsTicker.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 26/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

struct CoinsTicker : Decodable {
    let name : String
    var price : String?
       var number : String?
  enum CodingKeys : String, CodingKey
  {
    case name = "name"
    case price = "price_usd"
    case number = "percent_change_1h"
    }
}
