//
//  ViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/6/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController, UITextFieldDelegate {

    // *** Add code to update whether existingUser = true
    var existingUser = false

    // MARK: Outlets
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createPasswordLabel: UILabel!
    @IBOutlet weak var enterPasswordLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.Password.delegate = self
        
        if existingUser == true {
            createPasswordLabel.isHidden = true
            enterPasswordLabel.isHidden = false
            createAccountButton.isHidden = true
            loginButton.isHidden = false
        }
        else {
            createPasswordLabel.isHidden = false
            enterPasswordLabel.isHidden = true
            createAccountButton.isHidden = false
            loginButton.isHidden = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate for firstName
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        Password.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        DataContainerSingleton.sharedDataContainer.password = Password.text
        return true
    }

    // MARK: Actions
    @IBAction func createAccountButtonPressed(_ sender: Any) {
        DataContainerSingleton.sharedDataContainer.password = Password.text
        apollo.perform(mutation: CreateAUserMutation(newUser: CreateUserInput(username: DataContainerSingleton.sharedDataContainer.emailAddress!,password: DataContainerSingleton.sharedDataContainer.password!))) { (result, error) in
            }
       }

}
