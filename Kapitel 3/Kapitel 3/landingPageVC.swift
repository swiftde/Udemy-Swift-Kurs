//
//  landingPageVC.swift
//  Kapitel 3
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class landingPageVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var images = [UIImage]()
        
        for i in 1...6 {
            images.append(UIImage(named: "bild-0\(i).jpg")!)
        }
        
        for (index,image) in enumerate(images) {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRectZero
            imageView.sizeToFit()
            imageView.frame.origin.x += CGFloat(index) * view.frame.size.width
            scrollView.addSubview(imageView)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(images.count) * view.frame.size.width, height: view.frame.size.height)
        scrollView.bounces = false
        scrollView.pagingEnabled = true
    }
    
}














