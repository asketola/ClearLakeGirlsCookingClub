//
//  AllRecipesViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class AllRecipesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var recipeCollectionView: UICollectionView!
    
    var dishLabels = ["Burgers", "Noodles", "Salad", "Soup", "Popeovers", "Margarita", "Pie"]
    var dishImages = ["IMG_3375.jpg", "Sesame-Noodles.jpg", "salad.jpeg", "cheesy_soup.jpg", "popovers.jpg", "frozen-margarita.jpg", "Strawberry-Rhubarb-Pie.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dishLabels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:RecipeCell = collectionView.dequeueReusableCellWithReuseIdentifier("RecipeCell", forIndexPath: indexPath) as! RecipeCell
        
        cell.recipeImage.image = UIImage(named: dishImages[indexPath.row])
        cell.recipeNameLabel?.text = dishLabels[indexPath.row]
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("You picked \(indexPath.row)")
    }
    

    @IBAction func backButtonPressed(sender: AnyObject) {
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
