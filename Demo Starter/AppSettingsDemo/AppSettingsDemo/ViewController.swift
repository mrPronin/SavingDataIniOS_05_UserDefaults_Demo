//
//  ViewController.swift
//  AppSettingsDemo
//
//  Created by Brian on 11/4/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstName: UITextField!
  @IBOutlet weak var lastName: UITextField!
  @IBOutlet weak var mood: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var pickImageButton: UIButton!

  @IBAction func pickPhoto(sender: AnyObject) {
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.sourceType = .PhotoLibrary
    presentViewController(picker, animated: true, completion: nil)
    pickImageButton.hidden = true
  }

  @IBAction func saveData(sender: AnyObject) {
   
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    firstName.delegate = self
    lastName.delegate = self
    
  }
  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

extension ViewController: UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    if let image = info[UIImagePickerControllerOriginalImage] {
      imageView.image = image as? UIImage
      dismissViewControllerAnimated(true, completion: nil)
    }
  }
  
  
  
}