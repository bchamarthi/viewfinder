//
//  ViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // now we have access to more methods appropriate for camera usage and navigating between the camera and our main page
    
    var imagePicker = UIImagePickerController()  // this is not of the type ControllerDelegate, but just of Controller
    
    
    
    override func viewDidLoad() { // everything inside of these brackets of the viewDidLoad function happens automatically
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var shownImage: UIImageView!
    
    @IBAction func cameraClickHere(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func gallery(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    @IBOutlet weak var captionText: UITextField!

    @IBAction func savebutton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        let photoToSave = Photo(entity: Photo.entity(), insertInto: context)
         photoToSave.caption = captionText.text
            
            if let userImage = shownImage.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
        
        }
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
                
            }
            }
            
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            navigationController?.popViewController(animated: true)
        }
    internal func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            shownImage.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
            
        }
    }

        
}



