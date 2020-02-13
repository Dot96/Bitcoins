//
//  GetCoins.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

struct GetCoins {
    
    let coins: [Coins]
    
    init(json: Any) throws {
        guard let array = json as? [[String: Any]] else { throw NetError.someError }
        
        var coins = [Coins]()
        for item in array {
            guard let post = Coins(dict: item) else { continue }
            coins.append(post)
        }
        self.coins = coins
    }
    
}
