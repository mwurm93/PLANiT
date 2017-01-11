//
//  SuggestDestinationViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 12/28/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class SuggestDestinationViewController: UIViewController, UITextFieldDelegate {
    //MARK: Outlets
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var wantToSuggestDestination: UISegmentedControl!
    @IBOutlet weak var suggestDestinationField: UITextField!
    
    var suggestDestinationControlValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggest_destination_control") as? String
    var suggestedDestinationValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggested_destination") as? String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestDestinationField.isHidden = true
        suggestDestinationField.layer.borderWidth = 1
        suggestDestinationField.layer.cornerRadius = 5
        suggestDestinationField.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.25).cgColor
        suggestDestinationField.layer.masksToBounds = true
        let suggestDestinationLabelPlaceholder = suggestDestinationField!.value(forKey: "placeholderLabel") as? UILabel
        suggestDestinationLabelPlaceholder?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)

        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        if tripNameValue != nil {
            self.tripNameLabel.text =  "\(tripNameValue!)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Install the value into the label and unhide
        if suggestDestinationControlValue == "Yes" {
            wantToSuggestDestination.selectedSegmentIndex = 0
            suggestDestinationField.isHidden = false
            if suggestedDestinationValue != nil {
                self.suggestDestinationField.text =  "\(suggestedDestinationValue!)"
            }
        }
        else if suggestDestinationControlValue == "No" {
            wantToSuggestDestination.selectedSegmentIndex = 1
            suggestDestinationField.isHidden = true
        }
    }
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        suggestDestinationField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    // MARK: Actions

    @IBAction func suggestDestinationControlValueChanged(_ sender: Any) {
    if wantToSuggestDestination.selectedSegmentIndex == 0 {
            suggestDestinationControlValue = "Yes"
        }
        else {
            suggestDestinationControlValue = "No"
        }
        
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        let multipleDestionationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String
        let travelingInternationalValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "traveling_international") as? String
        let selectedDates = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "selected_dates") as? [Date]

        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestionationsValue, "traveling_international": travelingInternationalValue, "suggest_destination_control": suggestDestinationControlValue,"selected_dates": selectedDates] as [String : Any]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
    }


    @IBAction func wantToSuggestDestinationValueYes(_ sender: Any) {
        if wantToSuggestDestination.selectedSegmentIndex == 0 {
            suggestDestinationField.isHidden = false
        }
        else if wantToSuggestDestination.selectedSegmentIndex == 1 {suggestDestinationField.isHidden = true
        }
    }
    
    @IBAction func suggestedDestinationValueChanged(_ sender: Any) {
        suggestedDestinationValue = suggestDestinationField.text
        
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        let multipleDestionationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String
        let travelingInternationalValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "traveling_international") as? String
        let suggestDestinationControlValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "suggest_destination_control") as? String
        
        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestionationsValue, "traveling_international": travelingInternationalValue, "suggest_destination_control": suggestDestinationControlValue, "suggested_destination": suggestedDestinationValue]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
    }
    
}

