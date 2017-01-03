//
//  CalendarViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var multipleDestinations: UISegmentedControl!
    
    //Load the values from our shared data container singleton: Multiple Destination Picker
    var multipleDestinationsValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "multiple_destinations") as? String

       override func viewDidLoad() {
        super.viewDidLoad()

        //Load the values from our shared data container singleton: Trip Name
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Install the value into the label.
        if multipleDestinationsValue == "Yes" {
            multipleDestinations.selectedSegmentIndex = 0
        }
        else if multipleDestinationsValue == "No" {
            multipleDestinations.selectedSegmentIndex = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Actions
    @IBAction func multipleDestinationsValueChanged(_ sender: Any) {
        if multipleDestinations.selectedSegmentIndex == 0 {
            multipleDestinationsValue = "Yes"
        }
        else {
            multipleDestinationsValue = "No"
        }
        
        var existing_trips = DataContainerSingleton.sharedDataContainer.usertrippreferences
        let currentTripIndex = DataContainerSingleton.sharedDataContainer.currenttrip!
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        
        let updatedTripToBeSaved = ["trip_name": tripNameValue, "multiple_destinations": multipleDestinationsValue]
        existing_trips?[currentTripIndex] = updatedTripToBeSaved as NSDictionary
        DataContainerSingleton.sharedDataContainer.usertrippreferences = existing_trips

    }
}
