//
//  RecommendationsVoting.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/14/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class RecommendationSwipingViewController: UIViewController {

    // MARK: Outlets    
    @IBOutlet weak var recommendationsTable: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        //round edges
        recommendationsTable.layer.cornerRadius = 5
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?[DataContainerSingleton.sharedDataContainer.currenttrip!].object(forKey: "trip_name") as? String
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
