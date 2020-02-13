//
//  NewsViewController.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    
     var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    var news = [News]()
           
           override func viewDidLoad() {
               super.viewDidLoad()
               
                title = "Latest News"
            
            self.activityIndicatorView = UIActivityIndicatorView(style: .white)
            self.activityIndicatorView.startAnimating()
            self.tableView.separatorStyle = .none
            DispatchQueue.main.async {
                Thread.sleep(forTimeInterval: 3)}
            self.tableView.backgroundView = self.activityIndicatorView
            
            
            NewsNetworking.getNews { (response) in
                   let new = response.news
                   self.news = new
                   self.tableView.reloadData()
               }
           }
       }
extension  NewsViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let new = news[indexPath.row]
        cell.imgview!.downloadimg(url: self.news[indexPath.row].urlimg!)
        cell.configure(withNews: new)
        return cell
    }
}

extension UIImageView {
    func downloadimg ( url :String){
        let urlReq = URLRequest (url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlReq) { (data,response,error) in
            
            if error != nil {
                print("Error:\(error)")
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage (data: data!)
            }
        }
        task.resume()
    }
}
