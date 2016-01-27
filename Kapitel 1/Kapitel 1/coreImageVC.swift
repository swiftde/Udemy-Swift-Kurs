//
//  coreImageVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class coreImageVC: UIViewController {
    
    var imageView: UIImageView!
    var slider: UISlider!
    
    var uiBild: UIImage! {
        didSet{
            imageView.image = uiBild
        }
    }
    
    var ciBild: CIImage {
        get{
            return uiBild.CIImage!
        }
        set{
            uiBild = UIImage(CIImage: newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame: view.frame)
        view.addSubview(imageView)
        
        let frame = CGRect(x: 0, y: view.frame.size.height-50, width: view.frame.size.width, height: 50)
        slider = UISlider(frame: frame)
        slider.maximumValue = 50.0
        slider.value = 5.0
        slider.addTarget(self, action: "sliderChanged:", forControlEvents: .ValueChanged)
        view.addSubview(slider)
        
        let dateiURL = NSBundle.mainBundle().URLForResource("bild", withExtension: "jpg")
        ciBild = CIImage(contentsOfURL: dateiURL!)!
        
        let image = blur(slider.value, image: ciBild)
        imageView.image = UIImage(CIImage: image)
    }
    
    func sliderChanged(sender: UISlider) {
        let value = Float(Int(slider.value))
        slider.value = value
        
        let image = blur(value, image: ciBild)
        imageView.image = UIImage(CIImage: image)
    }
    
    func blur(radius: Float, image: CIImage) -> CIImage {
        let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
            ])
        return filter!.valueForKey(kCIOutputImageKey) as! CIImage
    }


}
