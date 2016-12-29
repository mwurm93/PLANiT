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
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?.last?["trip_name"]
        
        //Install the value into the label.
        
        if tripNameValue == nil {
        }
        else {
        self.newTripNameTextField.text =  "\(tripNameValue!)"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    @IBAction func newTripVCtoCalendarVC(_ sender: Any) {
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        if existing_trips == nil {
            var newTrip = ["trip_name": newTripNameTextField.text]
            var user_trip = [newTrip]
            DataContainerSingleton.sharedDataContainer.usertrippreferences = user_trip as [NSDictionary]?
        }
        else {
            var newTripToBeAppended = ["trip_name": newTripNameTextField.text]
            existing_trips?.append(newTripToBeAppended as NSDictionary)
            DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips
        }
    }

}
