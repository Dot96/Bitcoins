//
//  TickersViewController.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 23/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

let switchisonkey = "ison"
let switchisoffkey = "isoff"

class TickersViewController: UIViewController {
    var coinstest = [CoinsTicker]()
    var bitmodel : [CoinsTicker] = [] {
           didSet {
               self.TableView.reloadTable()
           }
       }
    
    @IBOutlet var TableView: UITableView!
    var isAlpha = false
   
    let isOn = Notification.Name (rawValue: switchisonkey )
    let isOff = Notification.Name (rawValue: switchisoffkey )
    
    let URL_b = "https://api.coinmarketcap.com/v1/ticker/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tickers"
        fetchCoins()
        createObservers()
    }
    func fetchCoins() {
        let url = URL(string: URL_b)!
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
    
    /// The settings view will send the changes to this view and we need this method to know (switch on or off ? )
    func  createObservers () {
        //isOn
        NotificationCenter.default.addObserver(self, selector:#selector(updateTableView(notificaion:)), name: isOn , object: nil)
        //isOff
          NotificationCenter.default.addObserver(self, selector:#selector(updateTableView(notificaion:)), name: isOff , object: nil)
    }
    
    /// when switch "isOn" the table view will reorder alphabetically
    /// - Parameter notificaion: to haer the changes
    @objc func updateTableView(notificaion: NSNotification){
        let isOon = notificaion.name == isOn
        if isOon {
            isAlpha = true
            fetchCoins()
            
        } else {
            isAlpha = false
          fetchCoins()
        }
     }
}

extension TickersViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bitmodel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BitCell", for: indexPath) as! TickersTableViewCell
        cell.Price.text = "$" + String(bitmodel[indexPath.row].price!)
        if let num = bitmodel[indexPath.row].number {
            if num.contains("-"){
                cell.Last24.textColor = .red
            } else {
                cell.Last24.textColor = .green
            }
        }
        cell.Last24.text = bitmodel[indexPath.row].number
        cell.Name.text = bitmodel[indexPath.row].name

        return cell
    }
}

extension UITableView {
    func reloadTable (){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
