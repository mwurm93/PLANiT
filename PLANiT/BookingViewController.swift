//
//  BookingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, UITextFieldDelegate {

    //MARK: outlets
    @IBOutlet weak var userStatusIndicators: UITableView!
    @IBOutlet weak var finalItineraryItemized: UITableView!
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var knownTravelerNumber: UITextField!
    @IBOutlet weak var redressNumber: UITextField!
    @IBOutlet weak var passportNumber: UITextField!
    @IBOutlet weak var bookingYesOrNo: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round table corners
        userStatusIndicators.layer.cornerRadius = 5
        finalItineraryItemized.layer.cornerRadius = 5
        bookingYesOrNo.layer.cornerRadius = 5
        
        // Create delegates for text fields
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.emailAddress.delegate = self
        self.gender.delegate = self
        self.phone.delegate = self
        self.passportNumber.delegate = self
        self.knownTravelerNumber.delegate = self
        self.redressNumber.delegate = self
        self.birthdate.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        let firstNameValue = DataContainerSingleton.sharedDataContainer.firstName ?? ""
        let lastNameValue = DataContainerSingleton.sharedDataContainer.lastName ?? ""
        let emailAddressValue = DataContainerSingleton.sharedDataContainer.emailAddress ?? ""
        let genderValue = DataContainerSingleton.sharedDataContainer.gender ?? ""
        let phoneValue = DataContainerSingleton.sharedDataContainer.phone ?? ""
        let passportNumberValue = DataContainerSingleton.sharedDataContainer.passportNumber ?? ""
        let knownTravelerNumberValue = DataContainerSingleton.sharedDataContainer.knownTravelerNumber ?? ""
        let redressNumberValue = DataContainerSingleton.sharedDataContainer.redressNumber ?? ""
        let birthdateValue = DataContainerSingleton.sharedDataContainer.birthdate ?? ""
        
        //Install the value into the text field.
        self.firstName.text =  "\(firstNameValue)"
        self.lastName.text =  "\(lastNameValue)"
        self.emailAddress.text =  "\(emailAddressValue)"
        self.gender.text =  "\(genderValue)"
        self.phone.text =  "\(phoneValue)"
        self.passportNumber.text =  "\(passportNumberValue)"
        self.knownTravelerNumber.text =  "\(knownTravelerNumberValue)"
        self.redressNumber.text =  "\(redressNumberValue)"
        self.birthdate.text =  "\(birthdateValue)"
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        emailAddress.resignFirstResponder()
        gender.resignFirstResponder()
        phone.resignFirstResponder()
        passportNumber.resignFirstResponder()
        knownTravelerNumber.resignFirstResponder()
        redressNumber.resignFirstResponder()
        birthdate.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        DataContainerSingleton.sharedDataContainer.firstName = firstName.text
        DataContainerSingleton.sharedDataContainer.lastName = lastName.text
        DataContainerSingleton.sharedDataContainer.emailAddress = emailAddress.text
        DataContainerSingleton.sharedDataContainer.gender = gender.text
        DataContainerSingleton.sharedDataContainer.phone = phone.text
        DataContainerSingleton.sharedDataContainer.passportNumber = passportNumber.text
        DataContainerSingleton.sharedDataContainer.knownTravelerNumber = knownTravelerNumber.text
        DataContainerSingleton.sharedDataContainer.redressNumber = redressNumber.text
        DataContainerSingleton.sharedDataContainer.birthdate = birthdate.text
        return true
    }


}
