//
//  KeyboardViewController.swift
//  myFancyUdemyKeyboard
//
//  Created by Udemy on 30.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var mainView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "KeyboardViewController", bundle: nil)
        mainView = nib.instantiateWithOwner(self, options: nil).first as UIView
        view.addSubview(mainView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var constraint = NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: 100)
        view.addConstraint(constraint)
        
        mainView.frame = view.frame
    }
    
    
    @IBAction func buchstabeGedrückt(sender: UIButton) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(sender.currentTitle!)
    }

    @IBAction func nächstesKeyboard(sender: UIButton) {
        advanceToNextInputMode()
    }
    
    @IBAction func löschen(sender: UIButton) {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
}












