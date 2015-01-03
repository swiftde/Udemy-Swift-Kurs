//
//  ncWidgetVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class ncWidgetVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let sharedDefaults = NSUserDefaults(suiteName: "group.BenchR.myFancyUdemyWidget")
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func didBecomeActive(sender: NSNotification) {
        updateLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel() {
        let nummer = sharedDefaults?.integerForKey("nummer")
        label.text = "\(nummer!)"
    }
    
    @IBAction func zurücksetzenButtonPressed(sender: UIButton) {
        
        sharedDefaults?.setInteger(0, forKey: "nummer")
        sharedDefaults?.synchronize()
        updateLabel()
    }
    
    
}



















