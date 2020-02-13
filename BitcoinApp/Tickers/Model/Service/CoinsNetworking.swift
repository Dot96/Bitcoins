//
//  CoinsNetworking.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation
class CoinsNetworking {
 private init() {}
    
    static func getCoins(completion: @escaping (GetCoins) -> Void) {
        guard let url = URL(string:  "https://api.coinmarketcap.com/v1/ticker/") else { return }
        NetService.shared.getData(fromURL: url) { (json) in
            do {
                let response = try GetCoins(json: json)
                completion(response)
            } catch {}
        }
    }
}
