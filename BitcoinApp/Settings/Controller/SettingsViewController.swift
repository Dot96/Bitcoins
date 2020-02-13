//
//  SettingsViewController.swift
//  BitcoinApp
//
//  Created by Abrar Ibrahim on 23/01/2020.
//  Copyright © 2020 Abrar Ibrahim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var mySwitch: UISwitch!
    var isAlpha = true
    let defult = UserDefaults.standard
    
    var firstTimeAppLaunch: Bool {
        get {
    ///Will return false when the key is not set.
            return defult.bool(forKey: "firstTimeAppLaunch")
        }
        set {}
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        title = "Settings"
        if !firstTimeAppLaunch {
            defult.set(true, forKey: "firstTimeAppLaunch")
            defult.set(true, forKey: "mySwitchValue")
        }
    }
    
    @IBAction func iSswitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
                   let name = Notification.Name (rawValue: switchisonkey )
                   NotificationCenter.default.post(name: name, object: nil)
          
        } else {
            let name = Notification.Name (rawValue: switchisoffkey )
                           NotificationCenter.default.post(name: name, object: nil)
        }

          defult.set(sender.isOn, forKey: "mySwitchValue")
               }
    
    override func viewDidAppear(_ animated: Bool) {
        mySwitch.isOn = defult.bool(forKey: "mySwitchValue")
    }
    
}
