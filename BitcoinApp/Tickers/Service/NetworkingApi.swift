//
//  NetworkingApi.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 12/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

class NetworkingApi {
    private init() {}
   var isAlpha = true
   var coinstest = [CoinsTicker]()
    var bitmodel : [CoinsTicker] = []
    
    static let shared = NetworkingApi()
    
    func getDate (from urlB : URL){
        
            let url = urlB
            var urlReq = URLRequest(url: url)
            urlReq.timeoutInterval = 5
            URLSession.shared.dataTask(with: urlReq) { (data, responce, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let respo = responce {
                    print(respo)
                }
               
                if let data = data {
                    do {
                        if self.isAlpha == true {
                  self.coinstest = try JSONDecoder().decode([CoinsTicker].self, from: data).sorted{ $0.name < $1.name
                            }
                  self.bitmodel = self.coinstest
                 print(self.coinstest)
                        } else {
                            let jsonobject = try JSONDecoder().decode([CoinsTicker].self, from: data)
                 self.bitmodel = jsonobject
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        .resume()
            }
    
}
