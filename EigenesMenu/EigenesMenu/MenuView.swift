//
//  MenuView.swift
//  EigenesMenu
//
//  Created by Udemy on 27.02.15.
//  Copyright (c) 2015 benchr. All rights reserved.
//

import UIKit

@objc
protocol MenuViewDelegate {
    optional func menuView(sender: MenuView, pressedButtonAtIndex index: Int)
}

class MenuView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var einAusblendenButton: UIButton!
    var delegate: MenuViewDelegate?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSBundle.mainBundle().loadNibNamed("MenuView", owner: self, options: nil)
        addSubview(view)
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "pan:"))
    }
    
    func pan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(self)
        println(translation)
        var newY = min(superview!.frame.height - 60, frame.origin.y + translation.y)
        newY = max(superview!.frame.height - 360, newY)
        frame.origin.y = newY
        if newY != superview!.frame.height - 60 { visible = true }
        sender.setTranslation(CGPointZero, inView: self)
    }
    
    var visible: Bool = false {
        didSet{
            var titel = visible ? "Ausblenden" : "Einblenden"
            einAusblendenButton.setTitle(titel, forState: .Normal)
        }
    }
    @IBAction func pressedButton(sender: UIButton) {
        if sender.tag == 0 {
            UIView.animateWithDuration(0.5) {
                if self.visible { self.frame.origin.y = self.superview!.frame.height - 60 }
                else { self.frame.origin.y = self.superview!.frame.height - 360 }
            }
            visible = !visible
            return
        }
        delegate?.menuView?(self, pressedButtonAtIndex: sender.tag)
    }
}

















