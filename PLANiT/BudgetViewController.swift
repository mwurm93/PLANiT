//
//  BudgetViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class BudgetViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var budget: UITextField!
    @IBOutlet weak var tripNameLabel: UILabel!
    
    var budgetValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "budget") as? String

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.budget.delegate = self
        
        // Set appearance of textfield
        budget.layer.cornerRadius = 5
        budget.layer.borderWidth = 1
        budget.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        budget.layer.masksToBounds = true
        
        let budgetLabelPlaceholder = budget!.value(forKey: "placeholderLabel") as? UILabel
        budgetLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)

        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        if tripNameValue != nil {
            self.tripNameLabel.text =  "\(tripNameValue!)"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Install the value into the label and unhide
        if budgetValue != nil {
        self.budget.text =  "\(budgetValue!)"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
    // Hide the keyboard.
    budget.resignFirstResponder()
    return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
    return true
    }
    
// If budget field is changed, updated and save trip array
    @IBAction func budgetEditingChanged(_ sender: Any) {
        budgetValue = budget.text
        
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        let multipleDestionationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String
        let travelingInternationalValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "traveling_international") as? String
        let suggestDestinationControlValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggest_destination_control") as? String
        let suggestedDestinationValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggested_destination") as? String
        let selectedDates = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_dates") as? [Date]
        
        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestionationsValue, "traveling_international": travelingInternationalValue, "suggest_destination_control": suggestDestinationControlValue, "suggested_destination": suggestedDestinationValue, "budget": budgetValue, "selected_dates":selectedDates] as [String : Any]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
    }


}
