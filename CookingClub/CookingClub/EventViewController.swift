//
//  EventViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/10/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    // not sure how to hook up map
//    @IBOutlet weak var hostMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // get date and dishes from Parse
        dateLabel.text = "Monday June 15th, 2015"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
