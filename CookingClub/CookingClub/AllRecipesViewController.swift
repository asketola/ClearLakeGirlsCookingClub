//
//  AllRecipesViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class AllRecipesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var recipeCollectionView: UICollectionView!

    
    var dishObjects: NSMutableArray! = NSMutableArray()
    var dishImages: NSMutableArray! = NSMutableArray()
    
    var object: PFObject!
    var objectImage: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllDishes()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dishObjects.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:RecipeCell = collectionView.dequeueReusableCellWithReuseIdentifier("RecipeCell", forIndexPath: indexPath) as! RecipeCell
        
        var object: PFObject = self.dishObjects.objectAtIndex(indexPath.row) as! PFObject
        
        cell.recipeNameLabel?.text = object["recipeName"] as? String
        
        // Placeholder dish to show while the images load
        let dishImageUIimage = "dish.jpg"
        let dishImageUIimage1 = UIImage(named: dishImageUIimage)
        cell.recipeImage.image = dishImageUIimage1
        
        // Lazily load the images in the cells
        let dishPicture = object["recipeImage"] as! PFFile
        dishPicture.getDataInBackgroundWithBlock { (imageData, error) -> Void in
            if (error == nil) {
                let image = UIImage(data:imageData!)
                cell.recipeImage.image = image
                self.dishImages.addObject(image!)
            }
        }
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("You picked \(indexPath.row)")
        
        self.object = self.dishObjects.objectAtIndex(indexPath.row) as! PFObject
        self.objectImage = self.dishImages.objectAtIndex(indexPath.row) as! UIImage
        
        println("The object we get back \(object)")
        performSegueWithIdentifier("SHOW_RECIPE_DETAIL", sender: self)
    }
    
    func fetchAllDishes() {
        // This is the query we send to Parse to get all the bikes that the shop sells
        var query: PFQuery = PFQuery(className: "Recipe")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil {
                // Each bike is an object so we add the object to the global array we defined
                var temp: NSArray = objects as AnyObject! as! NSArray
                self.dishObjects = temp.mutableCopy() as! NSMutableArray
                
                // reloads the tableView with the new data
                self.recipeCollectionView.reloadData()
            }
        }
    }
    

    @IBAction func backButtonPressed(sender: AnyObject) {
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_RECIPE_DETAIL" {
            let detailedVC = segue.destinationViewController as! ViewRecipeViewController
            detailedVC.dishData = object
            detailedVC.dishDataImage = objectImage
        }
    }
    

}
