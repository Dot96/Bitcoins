//
//  NetwService.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 13/02/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import Foundation

class NetwService {
private init() {}
    static let shared = NetwService()
    
    func getData(fromURL url: URL, completion: @escaping (Any)->Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:.mutableContainers) as! [String:AnyObject]
                DispatchQueue.main.async {
                    completion(json["articles"])
                }
            } catch {}
            
        }
        task.resume()
    }
}
