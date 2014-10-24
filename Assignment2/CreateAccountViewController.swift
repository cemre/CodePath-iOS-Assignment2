//
//  CreateAccountViewController.swift
//  Assignment2
//
//  Created by Cemre Güngör on 10/23/14.
//  Copyright (c) 2014 cemre. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    var alertView: UIAlertView!

    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var termsCheckbox: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkbox: UIButton!

    

    
    @IBAction func termsButton(sender: AnyObject) {
    }
    
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func checkboxTouchUp(sender: AnyObject) {
        checkbox.selected = !checkbox.selected

    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func createButtonTouchUp(sender: AnyObject) {
        if (checkbox.selected == false) {
            alertView = UIAlertView(title: "You need to accept the terms of service.", message: nil, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if (emailTextField.text.isEmpty) {
            alertView = UIAlertView(title: "Email required", message: "Please enter an email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (passwordTextField.text.isEmpty) {
            alertView = UIAlertView(title: "Password required", message: "Please enter a password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            alertView = UIAlertView(title: "Creating account...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            
            delay(2) {
                self.alertView.dismissWithClickedButtonIndex(0, animated: true)
                self.performSegueWithIdentifier("createToTutorialSegue", sender: self)
            }
        }
    }
    
    @IBAction func outsideOnTap(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = 74
            self.buttonView.frame.origin.y = 446
        })
    }
    
    @IBAction func textFieldEditingDidBegin(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = -30
            self.buttonView.frame.origin.y = 200
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkbox.setImage(UIImage(named: "check_box_selected.png"), forState: UIControlState.Selected)
        checkbox.setImage(UIImage(named: "check_box.png"), forState: UIControlState.Normal)
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
