//
//  contactMeVC.swift
//  Kapitel 1
//
//  Created by Udemy on 28.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import MessageUI

class contactMeVC: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    
    @IBAction func mailButtonPressed(sender: UIButton) {
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["swiftdetut@gmail.com"])
        mailController.setSubject("[iOS] Problem mit der iOS-App")
        mailController.setMessageBody("Hallo liebes SwiftDeTut-Team,\n\n\nich habe ein kleines Problem...:\n\n", isHTML: false)
        presentViewController(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func messageButtonPressed(sender: UIButton) {
        let smsController = MFMessageComposeViewController()
        smsController.messageComposeDelegate = self
        smsController.body = "Hallo, ich finde deine App total super! ;)"
        smsController.recipients = ["080012345678"]
        presentViewController(smsController, animated: true, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
