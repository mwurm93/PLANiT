//
//  OptionalPreferencesViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class InternationalViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tripNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?.last?["trip_name"]
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
