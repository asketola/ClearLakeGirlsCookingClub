//
//  MembersViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/10/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pendingMemberArray = ["IMG_3360.jpg", "Rachel Frick"]
    
    @IBOutlet weak var pendingMemberTableView: UITableView!
    @IBOutlet weak var memberTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var hostNib = UINib(nibName: "PendingMemberCell", bundle: nil)
        pendingMemberTableView.registerNib(hostNib, forCellReuseIdentifier: "PendingMemberCell")
        
        var dishNib = UINib(nibName: "MemberCell", bundle: nil)
        memberTableView.registerNib(dishNib, forCellReuseIdentifier: "MemberCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingMemberArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:PendingMemberCell = self.pendingMemberTableView.dequeueReusableCellWithIdentifier("PendingMemberCell") as! PendingMemberCell
        
        cell.pendingMemberNameLabel?.text = self.pendingMemberArray[1]
        var imageString = self.pendingMemberArray[0]
        cell.pendingMemberImage?.image = UIImage(contentsOfFile:imageString)
        
        return cell
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
