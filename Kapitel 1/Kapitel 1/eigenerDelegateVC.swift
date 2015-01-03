//
//  eigenerDelegateVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit

protocol BilderLaderDelegate {
    func lader(lader: BilderLader, fortschritt: Double)
    func laderIstFertig(lader: BilderLader, mitBildern bilder: [UIImage])
}

class BilderLader {
    
    var delegate: BilderLaderDelegate
    var urls: [NSURL]
    
    init(urls: [String], delegate: BilderLaderDelegate) {
        self.delegate = delegate
        self.urls = [NSURL]()
        for url in urls {
            self.urls.append(NSURL(string: url)!)
        }
    }
    
    var fertigGeladen = 0
    func lade() {
        var images = [UIImage]()
        dispatch_async(dispatch_get_global_queue(0, 0)) {
            for url in self.urls {
                let bildData = NSData(contentsOfURL: url)!
                self.fertigGeladen++
                let bild = UIImage(data: bildData)!
                images.append(bild)
                dispatch_async(dispatch_get_main_queue()) {
                    self.delegate.lader(self, fortschritt: Double(self.fertigGeladen)/Double(self.urls.count)*100)
                }
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.delegate.laderIstFertig(self, mitBildern: images)
            }
        }
    }
}

class eigenerDelegateVC: UIViewController, BilderLaderDelegate {

    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let lader = BilderLader(urls: urls, delegate: self)
        lader.lade()
    }
    
    func lader(lader: BilderLader, fortschritt: Double) {
        println("Fortschritt: \(fortschritt)%")
    }
    
    func laderIstFertig(lader: BilderLader, mitBildern bilder: [UIImage]) {
        println("Bilder wurden fertig geladen")
        dump(bilder)
    }
    
    
    
    
    
    
    let urls = ["http://www.android-hilfe.de/attachments/htc-one-s-forum/203695d1368768263-beispielbilder-versehentlich-geloescht-fairytail_falls.jpg", "http://www.android-hilfe.de/attachments/htc-one-s-forum/203690d1368768225-beispielbilder-versehentlich-geloescht-another_world.jpg", "http://www.android-hilfe.de/attachments/motorola-razr-razr-maxx-forum/57711d1321867244-kamera-des-razr-funktionen-beispielbilder-2011-11-18_13-11-08_620.jpg", "http://www.doktor-tacke.de/images/kategorien/Desert.jpeg", "http://www.android-hilfe.de/attachments/motorola-razr-razr-maxx-forum/66115d1327011481-kamera-des-razr-funktionen-beispielbilder-uploadfromtaptalk1327011463245.jpg", "http://www.doktor-tacke.de/images/kategorien/Chrysanthemum.jpeg", "http://www.onderka.com/wp-content/htc_diamond2_5mp_beispielbilder_12.jpg", "http://www.onderka.com/wp-content/htc_diamond2_5mp_beispielbilder_07.jpg", "http://www.doktor-tacke.de/images/kategorien/Koala.jpeg"]

}










