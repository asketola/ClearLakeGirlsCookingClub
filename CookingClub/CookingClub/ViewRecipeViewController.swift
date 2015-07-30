//
//  ViewRecipeViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class ViewRecipeViewController: UIViewController {
    
    // Labels
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeLinkLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    
    // the Parse object we passed from the previous view controller
    var dishData: PFObject!
    var dishDataImage: UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        recipeLinkLabel.text = dishData["recipeLink"] as? String
        recipeNameLabel.text = dishData["recipeName"] as? String
        quoteLabel.text = dishData["quote"] as? String
        recipeImage.image = dishDataImage
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        // do nothing, just go back to the RecipeCollectionView
    }


}
