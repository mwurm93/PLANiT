//
//  SettingsViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/14/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var nameHeaderForSettings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        //Load the values from our shared data container singleton
        let firstNameValue = DataContainerSingleton.sharedDataContainer.firstName ?? ""
        
        //Install the value into the text field.
        self.nameHeaderForSettings.text =  "\(firstNameValue)'s Profile"

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
