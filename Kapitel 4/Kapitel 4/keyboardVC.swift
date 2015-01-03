//
//  keyboardVC.swift
//  Kapitel 4
//
//  Created by Udemy on 30.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class keyboardVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.becomeFirstResponder()
    }
    
}