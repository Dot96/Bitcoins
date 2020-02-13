//
//  TickersViewController.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//


import UIKit
import UserNotifications

let switchisonkey = "ison"
let switchisoffkey = "isoff"
class TickersViewController: UIViewController {

    @IBOutlet var tabelView: UITableView!
    
    var  isAlpha = false
    let isOn = Notification.Name (rawValue: switchisonkey )
    let isOff = Notification.Name (rawValue: switchisoffkey )
    
     var coins = [Coins]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
             title = "Tickers"
            CoinsNetworking.getCoins { (response) in
                let coin = response.coins
                self.coins = coin
                self.tabelView.reloadData()
            }
            createObservers ()
        }
    }

extension TickersViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinsCell") as? CoinsCell else {
            return UITableViewCell()
        }
        if isAlpha == true {
         self.coins.sort(by: {$0.name < $1.name})
        }
        let coin = coins[indexPath.row]
        if let num = coins[indexPath.row].number {
                   if num.contains("-"){
                    cell.numberlabel.textColor = .red
                   } else {
                       cell.numberlabel.textColor = .green
                   }
               }
        cell.configure(withcoins:coin)
        return cell
    }
}

extension TickersViewController {
    func  createObservers () {
        //isOn
        NotificationCenter.default.addObserver(self, selector:#selector(updateTableView(notificaion:)), name: isOn , object: nil)
        //isOff
          NotificationCenter.default.addObserver(self, selector:#selector(updateTableView(notificaion:)), name: isOff , object: nil)
    }
    
    @objc func updateTableView(notificaion: NSNotification){
           let isOon = notificaion.name == isOn
           if isOon {
               isAlpha = true
                 CoinsNetworking.getCoins { (response) in
                            let coin = response.coins
                            self.coins = coin
                            self.tabelView.reloadData()
                        }
               
           } else {
               isAlpha = false
               CoinsNetworking.getCoins { (response) in
                          let coin = response.coins
                          self.coins = coin
                          self.tabelView.reloadData()
                      }
           }
        }
}
