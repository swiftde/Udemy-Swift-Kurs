//
//  userDefaultsVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class userDefaultsVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func speichernPressed(sender: UIButton) {
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        userDefaults.setObject(textField.text, forKey: "testKey")
        USERNAME = textField.text
    }
    
    @IBAction func ladenPressed(sender: UIButton) {
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        textField.text = userDefaults.objectForKey("testKey") as String
        textField.text = USERNAME
    }

}

var USERNAME: String? {
get{
    return NSUserDefaults.standardUserDefaults().objectForKey("username") as! String?
}
set{
    if newValue != nil {
        NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "username")
    }
    else {
        NSUserDefaults.standardUserDefaults().removeObjectForKey("username")
    }
}
}















