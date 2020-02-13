//
//  TickersTableViewCell.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 26/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class TickersTableViewCell: UITableViewCell {

    
    @IBOutlet var Name: UILabel!
    @IBOutlet var Price: UILabel!
    @IBOutlet var Last24: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
