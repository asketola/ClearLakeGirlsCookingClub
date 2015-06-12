//
//  EventViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/10/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    var hostNameArray = ["IMG_3360.jpg", "Anne Ketola", "(832)-524-5841", "Entree"]
    var otherDishesArray = ["IMG_3360.jpg", "Jenny Ortis", "(281)-226-4793", "Dessrt"]
    
    @IBOutlet weak var hostTableView: UITableView!
    @IBOutlet weak var otherDishesTableView: UITableView!
    
    
    // not sure how to hook up map
//    @IBOutlet weak var hostMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            cell.userImage?.image = UIImage(contentsOfFile:imageString)
            
            return cell
        } else {
            var cell:OtherDishCell = self.hostTableView.dequeueReusableCellWithIdentifier("OtherDishCell") as! OtherDishCell
            
            cell.usernameOtherLabel?.text = self.otherDishesArray[1]
            cell.dishOtherLabel?.text = self.otherDishesArray[3]
            var imageString = self.otherDishesArray[0]
            cell.userOtherImage?.image = UIImage(contentsOfFile:imageString)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 103
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
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
