//
//  ProfileViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Labels
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var upcomingCookingClubDatedLabel: UILabel!
    @IBOutlet weak var userNameLabel: UINavigationItem!
    
    // TableView
    @IBOutlet weak var upcomingCookigClubDatesTableView: UITableView!
    
    var itemsForTableView = ["Entree", "Dessert", "Appetizer", "Salad/Soup", "Side", "Bread", "Drink", "2nd Side", " 2nd Salad/Soup"]
    var datesForTableView = ["Monday, June 1, 2015", "Monday, June 8, 2015", "Monday, June 15, 2015", "Monday, June 22, 2015", "Monday, June 29, 2015", "Monday, July 6, 2015", "Monday, July 13, 2015", "Monday, July 20, 2015", "Monday, July 27, 2015"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "ProfileDateAndDishCell", bundle: nil)
        upcomingCookigClubDatesTableView.registerNib(nib, forCellReuseIdentifier: "ProfileDateAndDishCell")

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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForTableView.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell:ProfileDateAndDishCell = self.upcomingCookigClubDatesTableView.dequeueReusableCellWithIdentifier("ProfileDateAndDishCell") as! ProfileDateAndDishCell
        var cell:ProfileDateAndDishCell = self.upcomingCookigClubDatesTableView.dequeueReusableCellWithIdentifier("ProfileDateAndDishCell") as! ProfileDateAndDishCell
        
        cell.dishLabel?.text = self.itemsForTableView[indexPath.row]
        cell.dateLabel?.text = self.datesForTableView[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        upcomingCookigClubDatesTableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("SHOW_EVENT", sender: ProfileDateAndDishCell())
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepare for segue called")
        if segue.identifier == "SHOW_EVENT" {
            if let destination = segue.destinationViewController as? EventViewController {
                if let tableIndex = upcomingCookigClubDatesTableView.indexPathForSelectedRow()?.row {
                    // sends the info over to the next view controller
                    destination.tablename = itemsForTableView[tableIndex]
                    destination.tabledate = datesForTableView[tableIndex]
                }
                
            }

        }

    }


}
