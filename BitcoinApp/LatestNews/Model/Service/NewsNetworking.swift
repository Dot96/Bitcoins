//
//  NewsNetworking.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

class NewsNetworking {
 private init() {}
    
    static func getNews(completion: @escaping (GetNews) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9b6758f2f5214ac394dc3f7e4e566376") else { return }
        NetwService.shared.getData(fromURL: url) { (json) in
            do {
                let response = try GetNews(json: json)
                completion(response)
            } catch {}
        }
    }
}
