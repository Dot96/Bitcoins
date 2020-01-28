//
//  NewsTableViewCell.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 25/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var titletext: UILabel!
    @IBOutlet var imgnews: UIImageView!
    @IBOutlet var bodytext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
