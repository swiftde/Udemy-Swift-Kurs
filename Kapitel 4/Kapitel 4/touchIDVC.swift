//
//  touchIDVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class touchIDVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        login(self)
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        login(self)
    }
    
}



func login(vc: UIViewController) {
    let tempVC = loginVC(nibName: "loginVC", bundle: nil)
    vc.presentViewController(tempVC, animated: false, completion: nil)
}














