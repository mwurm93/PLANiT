//
//  SettingsViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/14/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var nameHeaderForSettings: UILabel!
    @IBOutlet weak var emailAddressSettingsField: UITextField!
    @IBOutlet weak var passwordSettingsField: UITextField!
    @IBOutlet weak var firstNameSettingsField: UITextField!
    @IBOutlet weak var lastNameSettingsField: UITextField!
    @IBOutlet weak var genderSettingsField: UITextField!
    @IBOutlet weak var phoneSettingsField: UITextField!
    @IBOutlet weak var homeAirportSettingsField: UITextField!
    @IBOutlet weak var passportNumberSettingsField: UITextField!
    @IBOutlet weak var knownTravelerNumberSettingsField: UITextField!
    @IBOutlet weak var redressNumberSettingsField: UITextField!
    @IBOutlet weak var birthdateSettingsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailAddressSettingsField.delegate = self
        self.passwordSettingsField.delegate = self
        self.firstNameSettingsField.delegate = self
        self.lastNameSettingsField.delegate = self
        self.genderSettingsField.delegate = self
        self.phoneSettingsField.delegate = self
        self.homeAirportSettingsField.delegate = self
        self.passportNumberSettingsField.delegate = self
        self.knownTravelerNumberSettingsField.delegate = self
        self.redressNumberSettingsField.delegate = self
        self.birthdateSettingsField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        let firstNameValue = DataContainerSingleton.sharedDataContainer.firstName ?? ""
        let lastNameValue = DataContainerSingleton.sharedDataContainer.lastName ?? ""
        let emailAddressValue = DataContainerSingleton.sharedDataContainer.emailAddress ?? ""
        let passwordValue = DataContainerSingleton.sharedDataContainer.password ?? ""
        let genderValue = DataContainerSingleton.sharedDataContainer.gender ?? ""
        let phoneValue = DataContainerSingleton.sharedDataContainer.phone ?? ""
        let homeAirportValue = DataContainerSingleton.sharedDataContainer.homeAirport ?? ""
        let passportNumberValue = DataContainerSingleton.sharedDataContainer.passportNumber ?? ""
        let knownTravelerNumberValue = DataContainerSingleton.sharedDataContainer.knownTravelerNumber ?? ""
        let redressNumberValue = DataContainerSingleton.sharedDataContainer.redressNumber ?? ""
        let birthdateValue = DataContainerSingleton.sharedDataContainer.birthdate ?? ""
        
        //Install the value into the text field.
        
        if firstNameValue == "" {
            self.nameHeaderForSettings.text =  "Profile"
        }
        else {
        self.nameHeaderForSettings.text =  "\(firstNameValue)'s Profile"
        }
        self.firstNameSettingsField.text =  "\(firstNameValue)"

        self.lastNameSettingsField.text =  "\(lastNameValue)"
        self.emailAddressSettingsField.text =  "\(emailAddressValue)"
        self.passwordSettingsField.text =  "\(passwordValue)"
        self.genderSettingsField.text =  "\(genderValue)"
        self.phoneSettingsField.text =  "\(phoneValue)"
        self.homeAirportSettingsField.text =  "\(homeAirportValue)"
        self.passportNumberSettingsField.text =  "\(passportNumberValue)"
        self.knownTravelerNumberSettingsField.text =  "\(knownTravelerNumberValue)"
        self.redressNumberSettingsField.text =  "\(redressNumberValue)"
        self.birthdateSettingsField.text =  "\(birthdateValue)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        firstNameSettingsField.resignFirstResponder()
        lastNameSettingsField.resignFirstResponder()
        emailAddressSettingsField.resignFirstResponder()
        passwordSettingsField.resignFirstResponder()
        genderSettingsField.resignFirstResponder()
        phoneSettingsField.resignFirstResponder()
        homeAirportSettingsField.resignFirstResponder()
        passportNumberSettingsField.resignFirstResponder()
        knownTravelerNumberSettingsField.resignFirstResponder()
        redressNumberSettingsField.resignFirstResponder()
        birthdateSettingsField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        DataContainerSingleton.sharedDataContainer.firstName = firstNameSettingsField.text
        DataContainerSingleton.sharedDataContainer.lastName = lastNameSettingsField.text
        DataContainerSingleton.sharedDataContainer.emailAddress = emailAddressSettingsField.text
        DataContainerSingleton.sharedDataContainer.password = passwordSettingsField.text
        DataContainerSingleton.sharedDataContainer.gender = genderSettingsField.text
        DataContainerSingleton.sharedDataContainer.phone = phoneSettingsField.text
        DataContainerSingleton.sharedDataContainer.homeAirport = homeAirportSettingsField.text
        DataContainerSingleton.sharedDataContainer.passportNumber = passportNumberSettingsField.text
        DataContainerSingleton.sharedDataContainer.knownTravelerNumber = knownTravelerNumberSettingsField.text
        DataContainerSingleton.sharedDataContainer.redressNumber = redressNumberSettingsField.text
        DataContainerSingleton.sharedDataContainer.birthdate = birthdateSettingsField.text
        return true
    }

}
