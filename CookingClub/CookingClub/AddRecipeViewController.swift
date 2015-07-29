//
//  AddRecipeViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController {
    
    // labels
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeLinkLabel: UILabel!
    @IBOutlet weak var recipeHeaderLabel: UINavigationItem! // not sure what to do with this
    @IBOutlet weak var userImage: UIImageView!
    
    // User inputs for the recipe
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var recipeTextField: UITextField!
    @IBOutlet weak var recipeLinkTextField: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var hostimage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quoteLabel.text = "Add Quote"
        recipeNameLabel.text = "Recipe Name:"
        recipeLinkLabel.text = "Recipe Link:"
        
        // get from Parse the userImage, placeholder there right now
        userImage.image = UIImage(named: "ASK_Profile_Circle.png")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonPressed(sender: AnyObject) {
        // send username, quote, recipe name, recipe link, recipe image to Parse
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
