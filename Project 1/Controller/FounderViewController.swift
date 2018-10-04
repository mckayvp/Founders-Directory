//
//  FounderViewController.swift
//  Project 1
//
//  Created by McKay Palmer on 10/1/18.
//  Copyright © 2018 McKay Palmer. All rights reserved.
//

import UIKit
import MessageUI

class FounderViewController : UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    
    // MARK: - Actions
    @IBAction func sendMessagePressed(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let messageComposeViewController = MFMessageComposeViewController()
            messageComposeViewController.recipients = [phoneNumber.text!]
            messageComposeViewController.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            present(messageComposeViewController, animated: true, completion: nil)
        }
    }
    @IBAction func callPhonePressed(_ sender: Any) {
        guard let number = URL(string: "tel://\(String(describing: phoneNumber))") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    @IBAction func sendEmailPressed(_ sender: Any) {
        guard let email = URL(string: "mailto:\(String(describing: emailAddress))") else { return }
        UIApplication.shared.open(email, options: [:], completionHandler: nil)
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make profile image circular 
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
    }
    
    // MARK: - Functions for contact buttons
    
//    func makePhoneCall(phoneNumber: String) {
//        if let phoneURL = NSURL(string: ("tel://" + phoneNumber)) {
//            let alert = UIAlertController(title: ("Call " + phoneNumber + "?"), message: nil, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
//                UIApplication.shared.openURL:(phoneURL as URL)
//            }))
//
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//            self.present(alert, animated: true, completion: nil)
//        }
//    }

}
