//
//  AccountViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UINavigationItem!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var fullUsernameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // new password button
    @IBAction func newPasswordButtonPressed(sender: AnyObject) {
    }
    
    // navigation buttons
    @IBAction func doneButtonPressed(sender: AnyObject) {
        // send fullUsername, username, phone, and address to Parse
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        // do nothing, send nothing to Parse
        // use unwind?
    }
    

    
    
    //navigation buttons
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
