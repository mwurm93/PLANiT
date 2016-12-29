//
//  SignUpViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/10/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var emailAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailAddress.delegate = self
        // apollo.fetch(query: GetTripQuery(id: "VHJpcDox")) { (result, error) in
        //    guard let data = result?.data else { return }
        //    self.emailAddress.text = data.getTrip?.name;
        // }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITextFieldDelegate for firstName
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        emailAddress.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        DataContainerSingleton.sharedDataContainer.emailAddress = emailAddress.text
        return true
    }
}
