//
//  socialVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import Social
import Accounts

class socialVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    let accountStore = ACAccountStore()
    let twitterType = ACAccountStore().accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
    var twitterAccount: ACAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = "Das ist ein Test-Tweet aus meinem Udemy-Swift-Video-Kurs. Release ist Anfang Januar 2015! #Swift"
        
        accountStore.requestAccessToAccountsWithType(twitterType, options: nil) {
            success, error in
            if success {
                let alleAccounts = self.accountStore.accountsWithAccountType(self.twitterType)
                if alleAccounts.count > 0 {
                    self.twitterAccount = alleAccounts.last as! ACAccount?
                    self.ladeProfilbild()
                }
            }
        }
    }
    
    func ladeProfilbild() {
        var json = [String: AnyObject]()
        let url = NSURL(string: "https://api.twitter.com/1.1/account/verify_credentials.json")!
        
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .GET, URL: url, parameters: nil)
        request.account = twitterAccount
        
        request.performRequestWithHandler { data, response, error in
            
            if response.statusCode == 200 {
                do {
                    json = try (NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)) as! [String: AnyObject]
                } catch {
                    print("Fehler in den json Daten!")
                    return
                }
                
                let bildURL = json["profile_image_url_https"] as! String
                let bildData = NSData(contentsOfURL: NSURL(string: bildURL)!)!
                let bild = UIImage(data: bildData)
                dispatch_async(dispatch_get_main_queue()) {
                    self.imageView.image = bild
                }
            }
            else {
                print("Authentifizierung fehlgeschlagen..")
            }
            
        }
    }
    
    
    @IBAction func tweetButtonPressed(sender: UIButton) {
        let url = NSURL(string: "https://api.twitter.com/1.1/statuses/update.json")!
        
        let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: .POST, URL: url, parameters: [
                "status": self.textField.text!
            ])
        request.account = twitterAccount
        
        request.performRequestWithHandler {
            data, response, error in
            
            if response.statusCode == 200 {
                print("Tweet wurde gesendet.")
            }
        }
    }
    
    @IBAction func facebookPostButtonPressed(sender: UIButton) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            controller.setInitialText("Ich poste über meine eigene App!!! OH MEIN GOTT :O")
            let image = UIImage(named: "bild.jpg")
            controller.addImage(image)
            let url = NSURL(string: "http://www.udemy.com")!
            controller.addURL(url)
            presentViewController(controller, animated: true, completion: nil)
        }
        else {
            print("Kein Facebook wurde hinterlegt.")
        }
        
    }
    
}
