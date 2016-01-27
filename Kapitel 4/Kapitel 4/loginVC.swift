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
        return passwortTextField.text == NSUserDefaults.standardUserDefaults().objectForKey("passwort") as? String
    }
    
    @IBAction func touchIDButtonPressed(sender: UIButton) {
        startTouchID()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTouchID()
    }
    
    func startTouchID() {
        
//        let context = LAContext()
//        
//        do {
//            try context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics)
//            
//            // Gerät bestitzt einen Touch ID Sensor
//            
//            context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Bitte legen Sie Ihren Finger auf den Touch ID Sensor.") {
//                success, error in
//                
//                if success {
//                    self.erfolg()
//                }
//                else {
//                    print("Fehler... \(error.localizedDescription)")
//                }
//                
//            }
//            
//        } catch _ {
//            print("TouchID nicht verfügbar.")
//        }
        
        // Get the local authentication context.
        let context = LAContext()
        
        // Declare a NSError variable.
        var error: NSError?
        
        // Set the reason string that will appear on the authentication alert.
        let reasonString = "Authentication is needed to access your test."
        
        // Check if the device can evaluate the policy.
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            [context .evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: { (success: Bool, evalPolicyError: NSError?) -> Void in
                
                if success {
                    // If authentication was successful then load the data.
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        self.erfolg()
                    })
                    
                } else {
                    // If authentication failed then show a message to the console with a short description.
                    // In case that the error is a user fallback, then show the password alert view.
                    print(evalPolicyError?.localizedDescription)
                    
                    switch evalPolicyError!.code {
                        
                    case LAError.SystemCancel.rawValue:
                        print("Authentication was cancelled by the system")
                        
                    case LAError.UserCancel.rawValue:
                        print("Authentication was cancelled by the user")
                        
                    case LAError.UserFallback.rawValue:
                        print("User selected to enter custom password")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.misserfolg()
                        })
                        
                    default:
                        print("Authentication failed")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            self.misserfolg()
                        })
                    }
                }
                
            })]
            
        } else {
            
            // If the security policy cannot be evaluated then show a short message depending on the error.
            switch error!.code {
                
            case LAError.TouchIDNotEnrolled.rawValue:
                print("TouchID is not enrolled")
                
            case LAError.PasscodeNotSet.rawValue:
                print("Kein Passwort gesetzt")
                
            default:
                // The LAError.TouchIDNotAvailable case.
                print("TouchID not available")
            }
            
            // Optionally the error description can be displayed on the console.
            print(error?.localizedDescription)
            
            // Show the custom alert view to allow users to enter the password.
            misserfolg()
        }
        
    }
    
    func erfolg() {
        print("Erfolgreich authentifiziert.")
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func misserfolg() {
        print("Nicht erfolgreich authentifiziert.")
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}















