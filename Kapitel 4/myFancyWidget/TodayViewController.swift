//
//  TodayViewController.swift
//  myFancyWidget
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    let sharedDefaults = NSUserDefaults(suiteName: "group.BenchR.myFancyUdemyWidget")
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        var nummer = sharedDefaults!.integerForKey("nummer")
        sharedDefaults?.setInteger(++nummer, forKey: "nummer")
        sharedDefaults?.synchronize()
        updateLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: 320, height: 50)
        updateLabel()
    }
    
    func updateLabel() {
        let nummer = sharedDefaults?.integerForKey("nummer")
        label.text = "\(nummer!)"
    }
    
    
    
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
