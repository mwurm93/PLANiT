//
//  Birthday&HomeAirportViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class BirthdayGenderViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var tripNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?.last?["trip_name"]
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        if DataContainerSingleton.sharedDataContainer.gender == "Male" {
            gender.selectedSegmentIndex = 0
        }
        else if DataContainerSingleton.sharedDataContainer.gender == "Female" {
            gender.selectedSegmentIndex = 1

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func GenderChanged(_ sender: UISegmentedControl) {
        if gender.selectedSegmentIndex == 0 {
            DataContainerSingleton.sharedDataContainer.gender = "Male"
        }
            else {
                DataContainerSingleton.sharedDataContainer.gender = "Female"
            }
        }
}
