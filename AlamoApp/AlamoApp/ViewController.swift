//
//  ViewController.swift
//  AlamoApp
//
//  Created by Udemy on 25.02.15.
//  Copyright (c) 2015 benchr. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let BILD_URL_2 = "https://farm5.staticflickr.com/4013/4509591701_49f1d55688_z_d.jpg"
    let BILD_URL = "https://farm3.staticflickr.com/2798/4171576818_458c181b85_o_d.jpg"
    
    @IBOutlet weak var imageView: UIImageView!
    var progressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = UIView(frame: CGRect(x: 0, y: view.frame.size.height - 50, width: 0, height: 50))
        progressView.backgroundColor = UIColor.redColor()
        view.addSubview(progressView)
        
        Alamofire.request(.GET, BILD_URL)
            .progress(updateProgress)
            .response {
                request, response, daten, error in
                
                if error != nil {
                    println(error?.localizedDescription)
                    return
                }
                
                if let daten = daten as? NSData {
                    let bild = UIImage(data: daten)
                    self.imageView.image = bild
                    self.setProgress(0)
                    
                }
        }
        
        
        
    }
    
    func setProgress(value: Int) {
        dispatch_async(dispatch_get_main_queue()) {
            self.progressView.frame.size.width *= CGFloat(value)/100
        }
    }
    
    func updateProgress(_: Int64, current: Int64, max: Int64) {
        dispatch_async(dispatch_get_main_queue()) {
            self.progressView.frame.size.width = CGFloat(current) / CGFloat(max) * self.view.frame.width
        }
    }


}











