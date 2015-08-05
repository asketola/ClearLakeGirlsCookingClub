//
//  ProfileViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Labels
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var clubNameLabel: UILabel!
    @IBOutlet weak var upcomingCookingClubDatedLabel: UILabel!
    @IBOutlet weak var userNameLabel: UINavigationItem!
    
    // TableView
    @IBOutlet weak var upcomingCookigClubDatesTableView: UITableView!
    
    var calendarObjects: NSMutableArray! = NSMutableArray()
    
    var itemsForTableView = ["Entree", "Dessert", "Appetizer", "Salad", "Soup", "Side", "Bread", "Drink", "2nd Side", "2nd Salad", "2nd Soup"]
    
    var datesForTableView: [String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUsersInfo()
        getCookingClubCalendarDates()
        
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
        var cell:ProfileDateAndDishCell = self.upcomingCookigClubDatesTableView.dequeueReusableCellWithIdentifier("ProfileDateAndDishCell") as! ProfileDateAndDishCell
        
//        var object: PFObject = self.calendarObjects.objectAtIndex(indexPath.row) as! PFObject
//        
//        cell.dishLabel?.text = object["dishSignUp"] as? String
//        cell.dateLabel?.text = object["date"] as? String
        
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
    
    func getCurrentUsersInfo() {
        var currentUser:PFUser = PFUser.currentUser()!
        var query = PFUser.query()
//        query!.whereKey("objectId", equalTo: currentUser.objectId!)
        
        query?.getObjectInBackgroundWithId( currentUser.objectId!, block: { (user, error) -> Void in
            if error == nil {
//        // lazily load the user's image
//                if let userPicture = user["userImage"] as? PFFile {
//                        userPicture.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//                            if (error == nil) {
//                                let image = UIImage(data:imageData!)
//                                self.userImage.layer.cornerRadius = 50.0
//                                self.userImage.image = image
//                            }
//                        }
//                }
                
            }
        })
        
        
        
//        // lazily load the user's image
//        let userPicture = user["userImage"] as! PFFile
//        userPicture.getDataInBackgroundWithBlock { (imageData, error) -> Void in
//            if (error == nil) {
//                let image = UIImage(data:imageData!)
//                self.userImage.layer.cornerRadius = 50.0
//                self.userImage.image = image
//            }
//        }
        
        // Pointer to get cooking Club's name/objectID
        // Do code here
        
    }
    
    func getCookingClubCalendarDates() {
        
        // This is the query we send to Parse to get all dates the cooking club has
        var query: PFQuery = PFQuery(className: "Date")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil {
                // Each bike is an object so we add the object to the global array we defined
                var temp: NSArray = objects as AnyObject! as! NSArray
                self.calendarObjects = temp.mutableCopy() as! NSMutableArray
                
                // reloads the tableView with the new data
                self.upcomingCookigClubDatesTableView.reloadData()
            }
        }
        
        self.datesForTableView = ["Monday, June 1, 2015", "Monday, June 8, 2015", "Monday, June 15, 2015", "Monday, June 22, 2015", "Monday, June 29, 2015", "Monday, July 6, 2015", "Monday, July 13, 2015", "Monday, July 20, 2015", "Monday, July 27, 2015"]
        
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
