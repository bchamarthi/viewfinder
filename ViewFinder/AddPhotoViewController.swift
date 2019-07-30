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
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func chooseGallery1(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }

    @IBAction func savebutton(_ sender: Any) {
    }
    
    @IBOutlet weak var shownImage: UIImageView!
    internal func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            shownImage.image = selectedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
