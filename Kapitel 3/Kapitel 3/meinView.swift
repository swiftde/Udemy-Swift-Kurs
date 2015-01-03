//
//  meinView.swift
//  Kapitel 3
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

@IBDesignable class meinView: UIView {
    
    @IBInspectable var backColor: UIColor = UIColor.redColor() {
        didSet{
            backgroundColor = backColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 10 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.blackColor() {
        didSet{
            layer.borderColor = borderColor.CGColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 20 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
}













