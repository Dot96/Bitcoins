//
//  GetNews.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

struct GetNews {
    
    let news: [News]
    
    init(json: Any) throws {
        guard let array = json as? [[String: Any]] else { throw NetError.someError }
        
        var news = [News]()
        for item in array {
            guard let new = News(dict: item) else { continue }
            news.append(new)
        }
        self.news = news
    }
}
