//
//  NewTripNameViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class NewTripNameViewController: UIViewController, UITextFieldDelegate {

// MARK: Outlets
    
    @IBOutlet weak var newTripNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newTripNameTextField.delegate = self
        
        //Load the values from our shared data container singleton
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        var numberSavedTrips: Int?
        var tripNameValue: String?
        if DataContainerSingleton.sharedDataContainer.usertrippreferences == nil {
            numberSavedTrips = 0
        }
        else {
        let SavedTrips = DataContainerSingleton.sharedDataContainer.usertrippreferences
            numberSavedTrips = (SavedTrips?.count)! - 1
        }
        if currentTripIndex > numberSavedTrips! {
        }
        else {
            tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        }
        
        //Install the value into the label.
        if tripNameValue == nil {
        }
        else {
        self.newTripNameTextField.text =  "\(tripNameValue!)"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UITextFieldDelegate
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        newTripNameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    //MARK: Actions
    @IBAction func TripNameEditingChanged(_ sender: Any) {
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        var numberSavedTrips: Int?
        if DataContainerSingleton.sharedDataContainer.usertrippreferences == nil {
            numberSavedTrips = 0
        }
        else {
            let SavedTrips = DataContainerSingleton.sharedDataContainer.usertrippreferences
            numberSavedTrips = (SavedTrips?.count)! - 1
        }
        
        if existing_trips == nil {
            let newTrip = ["trip_name": newTripNameTextField.text!]
            let user_trip = [newTrip]
            DataContainerSingleton.sharedDataContainer.usertrippreferences = user_trip as [NSDictionary]?
        }
        else if currentTripIndex <= numberSavedTrips!   {
            let updatedTripToBeSaved = ["trip_name": newTripNameTextField.text]
            existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
            DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
        }
        else {
            let newTripToBeAppended = ["trip_name": newTripNameTextField.text]
            existing_trips?.append(newTripToBeAppended as NSDictionary)
            DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
        }

    }
    
}
