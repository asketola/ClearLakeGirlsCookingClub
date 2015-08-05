//
//  AddRecipeViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit
import Parse

class AddRecipeViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // labels
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeLinkLabel: UILabel!
    @IBOutlet weak var recipeHeaderLabel: UINavigationItem! // not sure what to do with this
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var addPhotoLabel: UILabel!
    
    // for keyborad management
    var keyboardHeight: CGFloat!
    
    // User inputs for the recipe
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var recipeTextField: UITextField!
    @IBOutlet weak var recipeLinkTextField: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    
    // Uer inputs for the recipe image
//    @IBOutlet weak var recipeImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    var hostimage = String()
    
    // Activity spinner while we wait for Parse to add an item to the cart
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 105)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        self.userImage.layer.cornerRadius = 50.0
        
        quoteLabel.text = "Add Quote"
        recipeNameLabel.text = "Recipe Name:"
        recipeLinkLabel.text = "Recipe Link:"
        
        // pass the user's image from the page before ** still need to do this
        userImage.image = UIImage(named: "ASK_Profile_Circle.png")
        
        // Activity spinner while we wait for Parse to add our item to the cart
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        // starts the activity spinner
        self.actInd.startAnimating()
        
        var currentUser = PFUser.currentUser()
        
        var addRecipe = PFObject(className: "Recipe")
        addRecipe["recipeQuote"] = quoteTextField.text
        addRecipe["recipeName"] = recipeTextField.text
        addRecipe["recipeLink"] = recipeLinkTextField.text
        addRecipe.setObject(currentUser!, forKey: "author")
        
//        addRecipe[""] = recipeImage.image
        
        addRecipe.saveInBackgroundWithBlock { (Success: Bool, error: NSError?) -> Void in
            if error == nil {
                self.saveButton.enabled = false
                self.actInd.stopAnimating()
                println("Successfully added to recipe in Parse")
                
                let checkoutAlertController = UIAlertController(title: "Success!", message: "Your recipe has been added to the Cooking Club Library", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)

                checkoutAlertController.addAction(OKAction)
                self.presentViewController(checkoutAlertController, animated: true, completion: nil)
            } else {
                // Alert the user that something went wrong with adding the item to the cart
                let errorAlertController = UIAlertController(title: "Error Saving the Recipe", message: "Your item was not added to the Library. \n Error: \(error)", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                errorAlertController.addAction(OKAction)
                self.presentViewController(errorAlertController, animated: true, completion: nil)
            }
            
                
            }
        }
    
    // MARK: - ImagePicking and Camera code
    
    @IBAction func dishImageButtonPressed(sender: AnyObject) {
        
        //check to see what media sources our device has
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let WhichSourceAlert = UIAlertController(title: nil, message: "Please Select a Photo Source", preferredStyle: .Alert)
            let CameraSource = UIAlertAction(title: "Camera", style: .Default, handler: { (UIAlertAction) -> Void in
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .Camera
                self.imagePicker.cameraCaptureMode = .Photo
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            })
            let GallerySource = UIAlertAction(title: "Gallery", style: .Default, handler: { (UIAlertAction) -> Void in
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
            })
            let Cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
                WhichSourceAlert.addAction(Cancel)
                WhichSourceAlert.addAction(CameraSource)
                WhichSourceAlert.addAction(GallerySource)
                presentViewController(WhichSourceAlert, animated: true, completion: nil)
        } else {
            // if no camera, set source to Gallery
            self.imagePicker.allowsEditing = false
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            addPhotoLabel.hidden = true
            photoButton.setBackgroundImage(pickedImage, forState: UIControlState.Normal)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Keyboard managment code
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {
        case quoteTextField:
            recipeTextField.becomeFirstResponder()
            break
        case recipeTextField:
            recipeLinkTextField.becomeFirstResponder()
            break
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        quoteTextField.resignFirstResponder()
        recipeTextField.resignFirstResponder()
        recipeLinkTextField.resignFirstResponder()
    }
    
    
    func animateTextField(up: Bool) {
        var movement = (up ? -keyboardHeight : keyboardHeight)
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                keyboardHeight = keyboardSize.height
                self.animateTextField(true)
               }
        }
    }
    

}
