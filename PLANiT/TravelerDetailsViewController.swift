//
//  Birthday&HomeAirportViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class TravelerDetails: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var homeAirport: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeAirport.delegate = self
        self.gender.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        let genderValue = DataContainerSingleton.sharedDataContainer.gender ?? ""
        let homeAirportValue = DataContainerSingleton.sharedDataContainer.homeAirport ?? ""
        
        //Install the value into the text field.
        self.gender.text =  "\(genderValue)"
        self.homeAirport.text =  "\(homeAirportValue)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField:  UITextField) -> Bool {
        // Hide the keyboard.
        homeAirport.resignFirstResponder()
        gender.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        DataContainerSingleton.sharedDataContainer.homeAirport = homeAirport.text
        DataContainerSingleton.sharedDataContainer.gender = gender.text
        return true
    }
}
