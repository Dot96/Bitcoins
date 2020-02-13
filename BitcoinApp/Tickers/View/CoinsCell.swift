//
//  CoinsCell.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class CoinsCell: UITableViewCell {

    @IBOutlet var namelabel: UILabel!
    @IBOutlet var numberlabel: UILabel!
    @IBOutlet var pricelabel: UILabel!
    
    func configure(withcoins coin: Coins) {
        namelabel.text = coin.name
        numberlabel.text = coin.number
        pricelabel.text = coin.price
    }
}
