//
//  PickADishViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class PickADishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pickADishTableView: UITableView!
    
    var itemsForTableView = ["Entree", "Dessert", "Appetizer", "Salad/Soup", "Side", "Bread", "Drink", "Second Side", " Second Salad/Soup2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pickADishTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "DishCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addAReminderButtonPressed(sender: AnyObject) {
        // check if dish picked
        
        // alertView to add a reminder/notification
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        // send dish picked to Parse
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsForTableView.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.pickADishTableView.dequeueReusableCellWithIdentifier("DishCell") as! UITableViewCell
        
        cell.textLabel?.text = self.itemsForTableView[indexPath.row]
        
        return cell
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
