//
//  AccountViewController.swift
//  CookingClub
//
//  Created by Annemarie Ketola on 6/9/15.
//  Copyright (c) 2015 Annemarie Ketola. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var settingsLabel: UINavigationItem!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addPhotoLabel: UILabel!
    @IBOutlet weak var photoButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    // for keyboard management
    var keyboardHeight: CGFloat!
    
    // Activity spinner while we wait for Parse to add an item to the cart
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 105)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    

    // new password button
    @IBAction func newPasswordButtonPressed(sender: AnyObject) {
    }
    
    // navigation buttons
    @IBAction func doneButtonPressed(sender: AnyObject) {
        // send fullUsername, username, phone, and address to Parse
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        // do nothing, send nothing to Parse
        // use unwind?
    }
    

    @IBAction func addPhotoButtonPressed(sender: AnyObject) {
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
            println("We got to the didFinishPickingMediaWithInfo")
            addPhotoLabel.hidden = true
            photoButton.layer.cornerRadius = 20.0
            photoButton.setBackgroundImage(pickedImage, forState: UIControlState.Normal)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //navigation buttons
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
