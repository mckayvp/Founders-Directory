//
//  ProfileViewController.swift
//  Project 1
//
//  Created by McKay Palmer on 10/1/18.
//  Copyright © 2018 McKay Palmer. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    
    // MARK: - Actions
    @IBAction func choosePhotoFromLibrary(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shootPhotoWithCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.cameraCaptureMode = .photo
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    
    // MARK: - Constants
    let imagePicker = UIImagePickerController()
    
    private struct Profile {
        static let BorderWidth: CGFloat = 1.0
        static let CornerRadius: CGFloat = 16.0
    }
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make profile image circular
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        
        // Image picker: set ProfileViewController as delegate for the UIImagePickerController
        imagePicker.delegate = self
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = selectedImage
        
        // Dismissal of the picker
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }

}

