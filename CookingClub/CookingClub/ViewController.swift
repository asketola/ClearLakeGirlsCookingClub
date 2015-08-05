//
//  ViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 5/29/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var cookingClubLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // for keyboard managment
    var keyboardHeight: CGFloat!
    
    // Activity spinner while we wait for Parse to check login
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 105)) as UIActivityIndicatorView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Activity spinner while we wait for Parse to check login
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
    }
    
    // Keyboard management
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        }else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    func animateTextField(up: Bool) {
        var movement = (up ? -keyboardHeight : keyboardHeight)
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                keyboardHeight = keyboardSize.height
                self.animateTextField(true)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var userNameSegue = usernameTextField.text
        var passWordSegue = passwordTextField.text
        
        if segue.identifier == "SHOW_PROFILE" {
            let ProfileVC = segue.destinationViewController as! ProfileViewController
        } else if segue.identifier == "SHOW_START_CLUB" {
            let startVC = segue.destinationViewController as! StartClubViewController
            startVC.usernameStart = userNameSegue
            startVC.passwordStart = passWordSegue
        } else if segue.identifier == "SHOW_JOIN_CLUB" {
            let joinVC = segue.destinationViewController as! JoinClubViewController
            joinVC.usernameJoin = userNameSegue
            joinVC.passwordJoin = passWordSegue
        }
    }
    

    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        var userName = usernameTextField.text
        var passWord = passwordTextField.text
        
        if (count(userName.utf16) < 4 || count(passWord.utf16) < 5) {
            
            // Alert to notify the user there was a login failure (too short inputs)
            var alert = UIAlertController(title: "Invalid", message: "Username must be greater than 4 and Password must be greater than 5.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(OKAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }  else {
            // Starts the activity spinner
            self.actInd.startAnimating()
            
            PFUser.logInWithUsernameInBackground(userName, password: passWord, block: { (user, error) -> Void in
                self.actInd.stopAnimating()
                println(" we got here")
                    if ((user) != nil) {
                        println("We had success loggining in")
                        self.performSegueWithIdentifier("SHOW_PROFILE", sender: self)
                    } else {
                        // Alert to notify the user there was a login failure (incorrect username or password)
                        var alertFail = UIAlertController(title: "Error", message: "The username or password is incorrect", preferredStyle: .Alert)
                        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                        alertFail.addAction(OKAction)
                        self.presentViewController(alertFail, animated: true, completion: nil)
                    }
            })
        }
    }
    
    
    
    @IBAction func createButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func joinButtonPressed(sender: AnyObject) {
        
    }
    


}

