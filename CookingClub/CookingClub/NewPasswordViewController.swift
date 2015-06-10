//
//  NewPasswordViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var retypeNewPasswordTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // navigation buttons
    @IBAction func saveButtonPressed(sender: AnyObject) {
        // send username and new password to Parse
    }
    

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        // go back to previous page, send nothing to Parse
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
