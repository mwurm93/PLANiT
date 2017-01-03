//
//  groupRankingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class ReviewAndBookViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets

    @IBOutlet var adjustLogisticsView: UIView!
    @IBOutlet weak var popupBlurView: UIVisualEffectView!
    @IBOutlet weak var editTextBox: UITextView!
    @IBOutlet weak var topItineraryTable: UITableView!
    @IBOutlet weak var userStatusIndicators: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var passportNumber: UITextField!
    @IBOutlet weak var knownTravelerNumber: UITextField!
    @IBOutlet weak var redressNumber: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    
    // Outlets for buttons
    @IBOutlet weak var adjustTravelLogisticsButton: UIButton!
    
    // Create visual effect variable
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        effect = popupBlurView.effect
        popupBlurView.effect = nil
        
        adjustLogisticsView.layer.cornerRadius = 5
        editTextBox.layer.cornerRadius = 5
        topItineraryTable.layer.cornerRadius = 5
        userStatusIndicators.layer.cornerRadius = 5
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
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
        self.tripNameLabel.text =  "Book \(tripNameValue!)!"
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


    //Functions for adjusting logistics
    
    func animateAdjustLogisticsIn(){
        self.view.addSubview(adjustLogisticsView)
        adjustLogisticsView.center = self.view.center
        adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        adjustLogisticsView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.popupBlurView.effect = self.effect
            self.adjustLogisticsView.alpha = 1
            self.adjustLogisticsView.transform = CGAffineTransform.identity

        }
    }
    
    
    func dismissAdjustLogisticsOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.adjustLogisticsView.alpha = 0
        }) { (Success:Bool) in
            self.adjustLogisticsView.removeFromSuperview()
        }
    }
    
    func cancelAdjustLogisticsOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.adjustLogisticsView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupBlurView.effect = nil
            self.adjustLogisticsView.alpha = 0
        }) { (Success:Bool) in
            self.adjustLogisticsView.removeFromSuperview()
        }
    }

    // MARK: Actions
    @IBAction func adjustMyTravelLogistics(_ sender: AnyObject) {
    animateAdjustLogisticsIn()
        
        // Disable main view buttons
        adjustTravelLogisticsButton.isEnabled = false
    }
    @IBAction func cancelAdjustLogistics(_ sender: AnyObject) {
    cancelAdjustLogisticsOut()
     
        // Enable main view buttons
        adjustTravelLogisticsButton.isEnabled = true
    }
    @IBAction func dismissAdjustLogistics(_ sender: AnyObject) {
    dismissAdjustLogisticsOut()
        
        // Enable main view buttons
        adjustTravelLogisticsButton.isEnabled = true
    }
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}
