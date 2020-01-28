//
//  LatestNewsViewController.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 23/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class LatestNewsViewController: UIViewController {
    
    var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var TableView: UITableView!
    ///contains all Articles
    var Newsatt : [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Latest News"
        activityIndicatorView = UIActivityIndicatorView(style: .white)
               activityIndicatorView.startAnimating()
               TableView.separatorStyle = .none
               DispatchQueue.main.async {
                   Thread.sleep(forTimeInterval: 3)}
               TableView.backgroundView = activityIndicatorView
        fetchNews()
    }
    
    
    func fetchNews() {
        ///create URL request
        ///(task)  go and download all data in URL , After download we have (data,response,error) from json file
        let urlreq = URLRequest(url: URL( string:"https://newsapi.org/v2/everything?q=bitcoin&apiKey=9b6758f2f5214ac394dc3f7e4e566376")!) //
        let task = URLSession.shared.dataTask(with: urlreq) { (data,response,error) in
          
            if error != nil {
                print("Error:\(error)")
                return
            }
            
            self.Newsatt = [Articles]()
            
            do {
                ///parse the json
                ///data we recive from the url will save here , and mutableConainers because we will read data from dictionary
                ///[String:AnyObject] that's give me a  json format
                ///the articles is Array of dectioniary has Key and value
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:AnyObject]
                let articlfromjson = json["articles"] as? [[String:AnyObject]]
                ///forloop go to each Articles and extract what information i need
                for artfromjson in articlfromjson! {
                    let artic = Articles()
                    /// i will specify what information ill use
                    if let title = artfromjson["title"] as? String , let descrp = artfromjson["description"] as? String , let url = artfromjson["url"] as? String , let img = artfromjson["urlToImage"] as? String {
                        artic.Title = title
                        artic.Description = descrp
                        artic.urll = url
                        artic.imgurl = img
                    }
                    self.Newsatt.append(artic)
                }
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }
                
            } catch let error {
                print("Error:\(error)")
            }
            
        } /// Task and urlSession fire
        task.resume()
    }
    
    
    
}
extension LatestNewsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Newsatt.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTableViewCell
        cell.titletext.text = self.Newsatt[indexPath.item].Title
        cell.bodytext.text = self.Newsatt[indexPath.item].Description
        cell.imgnews!.downloadimg(url: self.Newsatt[indexPath.item].imgurl!)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
