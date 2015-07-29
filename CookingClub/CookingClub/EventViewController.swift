//
//  EventViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/10/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import MapKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    var hostNameArray = ["ASK_Profile_Circle.png", "Anne Ketola", "(555)-555-5555", "Entree"]
    var otherDishesArray = ["ASK_Profile_Circle.png", "Jenny Ortis", "(555)-555-5555", "Dessrt"]
    
    @IBOutlet weak var hostTableView: UITableView!
    @IBOutlet weak var otherDishesTableView: UITableView!
    
    @IBOutlet weak var hostMap: MKMapView!
    
    var tablename = String()
    var tabledate = String()

    
    // not sure how to hook up map
//    @IBOutlet weak var hostMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("here is passovers: \(tabledate) \(tablename)")
        dateLabel.text = "Monday June 5, 2015"
        
        var hostNib = UINib(nibName: "HostCell", bundle: nil)
        hostTableView.registerNib(hostNib, forCellReuseIdentifier: "HostCell")
        
        var dishNib = UINib(nibName: "OtherDishCell", bundle: nil)
        otherDishesTableView.registerNib(dishNib, forCellReuseIdentifier: "OtherDishCell")

        // Do any additional setup after loading the view.
        // get date and dishes from Parse

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickADishButtonPressed(sender: AnyObject) {
        // go to pick a dish controller
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        // go back to user's profile
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(hostTableView) {
         return hostNameArray.count
        }
        else {
         return otherDishesArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if tableView.isEqual(hostTableView) {
            var cell:HostCell = self.hostTableView.dequeueReusableCellWithIdentifier("HostCell") as! HostCell
        
            cell.usernameLabel?.text = self.hostNameArray[1]
            cell.phoneLabel?.text = self.hostNameArray[2]
            cell.dishLabel?.text = self.hostNameArray[3]
            var imageString = self.hostNameArray[0]
            cell.userImage?.image = UIImage(named:imageString)
            
            return cell
        } else {
            var cell:OtherDishCell = self.otherDishesTableView.dequeueReusableCellWithIdentifier("OtherDishCell") as! OtherDishCell
            
            cell.usernameOtherLabel?.text = self.otherDishesArray[1]
            cell.dishOtherLabel?.text = self.otherDishesArray[3]
            var imageString = self.otherDishesArray[0]
            cell.userOtherImage?.image = UIImage(named:imageString)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 103
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        hostTableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("SHOW_RECIPE_HOST", sender: HostCell())
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepare for segue called")
        if segue.identifier == "SHOW_RECIPE_HOST" {
            if let destination = segue.destinationViewController as? AddRecipeViewController {
                if let tableIndex = hostTableView.indexPathForSelectedRow()?.row {
                    // sends the info over to the next view controller
                    destination.hostimage = hostNameArray[tableIndex]

                }
                
            }
            
        }
        
    }

}
