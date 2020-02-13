//
//  NewsTableViewCell.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var titletext: UILabel!
    @IBOutlet var bodytext: UILabel!
    @IBOutlet var imgview: UIImageView!
    
    
    func configure(withNews news: News ) {
        titletext.text = news.title
           bodytext.text = news.description
       }
}
