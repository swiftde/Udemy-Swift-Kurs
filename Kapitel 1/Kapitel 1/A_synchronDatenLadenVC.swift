//
//  DetailVC.swift
//  Kapitel 1
//
//  Created by Udemy on 27.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

class a_synchronDatenLadenVC: UIViewController {

    var titel: String?
    var asynchron: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sichererTitel = titel {
            navigationItem.title = sichererTitel
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if !asynchron {
            ladeDasBildSynchron()
        }
        else {
            ladeDasBildAsynchron()
        }
        
    }
    
    func ladeDasBildSynchron() {
        let URL = NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg")!
        let datenDesBildes = NSData(contentsOfURL: URL)!
        let bild = UIImage(data: datenDesBildes)
        imageView.image = bild
    }
    
    func ladeDasBildAsynchron() {
        let URL = NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/f/f5/Steve_Jobs_Headshot_2010-CROP2.jpg")!
        let request = NSURLRequest(URL: URL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { response, data, error in
            if error != nil {
                println("Fehler....")
                return
            }
            let bild = UIImage(data: data)
            self.imageView.image = bild
        }
    }

}













