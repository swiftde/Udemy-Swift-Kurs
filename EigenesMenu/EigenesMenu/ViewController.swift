//
//  ViewController.swift
//  EigenesMenu
//
//  Created by Udemy on 27.02.15.
//  Copyright (c) 2015 benchr. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MenuViewDelegate {

    @IBOutlet var menu: MenuView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu?.delegate = self
    }
    
    func menuView(sender: MenuView, pressedButtonAtIndex index: Int) {
        println(index)
    }

}

