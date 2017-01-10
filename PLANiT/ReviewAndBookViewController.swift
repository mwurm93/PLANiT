//
//  groupRankingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class ReviewAndBookViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource,UITableViewDelegate {

    var destinationLabelViaSegue: String?
    var tripPriceViaSegue: String?
    
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
    @IBOutlet weak var bookThisTripButton: UIButton!
    
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
        
        bookThisTripButton.layer.borderWidth = 1
        bookThisTripButton.layer.borderColor = UIColor.white.cgColor
        bookThisTripButton.layer.cornerRadius = 8
        bookThisTripButton.layer.backgroundColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        
        // Set appearance of textfield
        firstName.layer.borderWidth = 0.5
        firstName.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        firstName.layer.masksToBounds = true
        firstName.layer.cornerRadius = 5
        let firstNameLabelPlaceholder = firstName!.value(forKey: "placeholderLabel") as? UILabel
        firstNameLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)

        
        lastName.layer.borderWidth = 0.5
        lastName.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        lastName.layer.masksToBounds = true
        lastName.layer.cornerRadius = 5
        let lastNameLabelPlaceholder = lastName!.value(forKey: "placeholderLabel") as? UILabel
        lastNameLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        emailAddress.layer.borderWidth = 0.5
        emailAddress.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        emailAddress.layer.masksToBounds = true
        emailAddress.layer.cornerRadius = 5
        let emailAddressLabelPlaceholder = emailAddress!.value(forKey: "placeholderLabel") as? UILabel
        emailAddressLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        gender.layer.borderWidth = 0.5
        gender.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        gender.layer.masksToBounds = true
        gender.layer.cornerRadius = 5
        let genderLabelPlaceholder = gender!.value(forKey: "placeholderLabel") as? UILabel
        genderLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)

        
        phone.layer.borderWidth = 0.5
        phone.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        phone.layer.masksToBounds = true
        phone.layer.cornerRadius = 5
        let phoneLabelPlaceholder = phone!.value(forKey: "placeholderLabel") as? UILabel
        phoneLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        passportNumber.layer.borderWidth = 0.5
        passportNumber.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        passportNumber.layer.masksToBounds = true
        passportNumber.layer.cornerRadius = 5
        let passportNumberLabelPlaceholder = passportNumber!.value(forKey: "placeholderLabel") as? UILabel
        passportNumberLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        knownTravelerNumber.layer.borderWidth = 0.5
        knownTravelerNumber.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        knownTravelerNumber.layer.masksToBounds = true
        knownTravelerNumber.layer.cornerRadius = 5
        let knownTravelerNumberLabelPlaceholder = knownTravelerNumber!.value(forKey: "placeholderLabel") as? UILabel
        knownTravelerNumberLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        redressNumber.layer.borderWidth = 0.5
        redressNumber.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        redressNumber.layer.masksToBounds = true
        redressNumber.layer.cornerRadius = 5
        let redressNumberLabelPlaceholder = redressNumber!.value(forKey: "placeholderLabel") as? UILabel
        redressNumberLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
        birthdate.layer.borderWidth = 0.5
        birthdate.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        birthdate.layer.masksToBounds = true
        birthdate.layer.cornerRadius = 5
        let birthdateLabelPlaceholder = birthdate!.value(forKey: "placeholderLabel") as? UILabel
        birthdateLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        
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
        if tripNameValue != nil {
        self.tripNameLabel.text =  "Book \(tripNameValue!)!"
        }
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

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemizedItineraryPrototypeCell", for: indexPath) as! itemizedItineraryTableViewCell
        
        cell.destinationLabel.text = destinationLabelViaSegue
        cell.totalPriceLabel.text = tripPriceViaSegue
        cell.accomodationLabel.text = "5 nights at the Westin"
        cell.accomodationPriceLabel.text = "$700"
        cell.TravelLabel.text = "Roundtrip on Southwest"
        cell.travelPriceLabel.text = "$300"
        
        cell.layer.cornerRadius = 5
        
        return (cell)
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
