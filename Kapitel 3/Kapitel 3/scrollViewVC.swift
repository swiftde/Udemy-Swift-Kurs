//
//  scrollViewVC.swift
//  Kapitel 3
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class scrollViewVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageView: UIImageView!

    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        let image = UIImage(named: "steve.jpg")!
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        scrollView.addSubview(imageView)
        
        scrollView.contentSize = image.size
        
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width/scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height/scrollView.contentSize.height
        scrollView.minimumZoomScale = min(scaleHeight, scaleWidth)
        
        scrollView.maximumZoomScale = 5.0
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        let tapHandler = UITapGestureRecognizer(target: self, action: "tapHandlerTapped:")
        tapHandler.numberOfTapsRequired = 2
        tapHandler.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(tapHandler)
    }
    
    func tapHandlerTapped(sender: UITapGestureRecognizer) {
        let frame = CGRect(x: 0, y: 0, width: imageView.image!.size.width, height: imageView.image!.size.height)
        scrollView.zoomToRect(frame, animated: true)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
}
































