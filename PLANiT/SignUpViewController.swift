//
//  SignUpViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/10/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
        
    var currentUser = User(userFirstName:"", userLastName:"",userEmailAddress:"",userPassword:"")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstName.delegate = self
        lastName.delegate = self
        emailAddress.delegate = self
        password.delegate = self
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == firstName) {
        firstName.text = textField.text
        currentUser?.userFirstName = firstName.text!
        }
        if (textField == lastName) {
            lastName.text = textField.text
            currentUser?.userLastName = lastName.text!
        }
        if (textField == emailAddress) {
            emailAddress.text = textField.text
            currentUser?.userEmailAddress = emailAddress.text!
        }
        if (textField == password) {
            password.text = textField.text
            currentUser?.userPassword = password.text!
        }
    }
    
    let settingsViewController = SettingsViewController()
    
    
    // MARK: Actions
    
    
    
}
