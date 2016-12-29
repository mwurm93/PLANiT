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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.budget.delegate = self
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?.last?["trip_name"]
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
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

}
