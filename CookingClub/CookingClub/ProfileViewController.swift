//
//  ProfileViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // Labels
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var upcomingCookingClubDatedLabel: UILabel!
    @IBOutlet weak var userNameLabel: UINavigationItem!
    
    // TableView
    @IBOutlet weak var upcomingCookigClubDatesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Navigation Buttons
    @IBAction func adminButtonPressed(sender: AnyObject) {
    }
    @IBAction func accountButtonPressed(sender: AnyObject) {
    }
    @IBAction func recipeButtonPressed(sender: AnyObject) {
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
