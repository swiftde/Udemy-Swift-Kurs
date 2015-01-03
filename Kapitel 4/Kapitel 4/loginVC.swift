//
//  loginVC.swift
//  Kapitel 4
//
//  Created by Udemy on 29.12.14.
//  Copyright (c) 2014 Udemy. All rights reserved.
//

import UIKit
import LocalAuthentication

class loginVC: UIViewController {

    @IBOutlet weak var passwortTextField: UITextField!
    
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        if stimmtDasPasswort() {
            erfolg()
        }
        else {
            let alert = UIAlertController(title: "Warnung", message: "Login war leider falsch.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func stimmtDasPasswort() -> Bool {
        return passwortTextField.text == NSUserDefaults.standardUserDefaults().objectForKey("passwort") as String
    }
    
    @IBAction func touchIDButtonPressed(sender: UIButton) {
        startTouchID()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTouchID()
    }
    
    func startTouchID() {
        
        let context = LAContext()
        
        if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: nil) {
            // Gerät bestitzt einen Touch ID Sensor
            
            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Bitte legen Sie Ihren Finger auf den Touch ID Sensor.") {
                success, error in
                
                if success {
                    self.erfolg()
                }
                else {
                    println("Fehler... \(error.localizedDescription)")
                }
                
            }
            
        }
        else {
            println("TouchID nicht verfügbar.")
        }
        
    }
    
    func erfolg() {
        println("Erfolgreich authentifiziert.")
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}















