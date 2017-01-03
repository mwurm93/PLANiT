//
//  ActivitiesViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var activitiesTable: UITableView!
    @IBOutlet weak var userToggles: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        activitiesTable.layer.cornerRadius = 5
        userToggles.layer.cornerRadius = 5
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
