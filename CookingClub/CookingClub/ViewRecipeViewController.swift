//
//  ViewRecipeViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse
import Bolts

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
        getUserImage()
        

        
        recipeLinkLabel.text = dishData["recipeLink"] as? String
        recipeNameLabel.text = dishData["recipeName"] as? String
        quoteLabel.text = dishData["quote"] as? String
        recipeImage.image = dishDataImage
 
    }
    
    func getUserImage() {
        
        var author: PFUser = dishData["author"] as! PFUser!
        var objectID: String = author.objectId!
        println("objectID = \(objectID)")
        let user:PFUser = PFQuery.getUserObjectWithId(objectID)!

        // lazily load the author's image
        let dishPicture = user["userImage"] as! PFFile
        dishPicture.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            if (error == nil) {
                let image = UIImage(data:imageData!)
                self.userImage.layer.cornerRadius = 50.0
                self.userImage.image = image
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        // do nothing, just go back to the RecipeCollectionView
    }


}
