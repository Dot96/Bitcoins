//
//  News.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

struct News {
    let title: String?
    let description: String?
    let url: String?
    let urlimg : String?
    
    init?(dict: [String: Any]) {
        guard let title = dict["title"] as? String,
            let descrp = dict["description"] as? String,
            let url = dict["url"] as? String,
        let urlimg = dict["urlToImage"] as? String
            else { return nil }
        
        self.title = title
        self.description = descrp
        self.url = url
        self.urlimg = urlimg
    }
}
