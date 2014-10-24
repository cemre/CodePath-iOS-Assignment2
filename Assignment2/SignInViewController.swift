//
//  SignInViewController.swift
//  Assignment2
//
//  Created by Cemre Güngör on 10/23/14.
//  Copyright (c) 2014 cemre. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var alertView: UIAlertView!
    
    @IBAction func outsideOnTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = 74
            self.buttonView.frame.origin.y = 446
        })
    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func textFieldEditingDidBegin(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = -30
            self.buttonView.frame.origin.y = 200
        })
        
    }

    
    @IBAction func signInButtonTouchUp(sender: AnyObject) {
        if (emailTextField.text.isEmpty) {
            alertView = UIAlertView(title: "Email required", message: "Please enter an email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (passwordTextField.text.isEmpty) {
            alertView = UIAlertView(title: "Password required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            alertView = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2) {
                self.checkPassword()
            }
        }
    }
    
    func checkPassword() {
        alertView.dismissWithClickedButtonIndex(0, animated: true)
        
        if (emailTextField.text.lowercaseString == "tim@thecodepath.com" && passwordTextField.text.lowercaseString == "swiftisfun") {
            performSegueWithIdentifier("tutorialSegue", sender: self)
        } else {
            alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password. Bummer!", delegate: self, cancelButtonTitle: "Try again")
            alertView.show()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
