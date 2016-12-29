//
//  rankingViewController.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 12/17/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var recommendationRankingTable: UITableView!
    @IBOutlet weak var tripNameLabel: UILabel!
    
    // viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendationRankingTable.layer.cornerRadius = 5
        
        //Load the values from our shared data container singleton
        let tripNameValue = DataContainerSingleton.sharedDataContainer.usertrippreferences?.last?["trip_name"]
        //Install the value into the label.
        self.tripNameLabel.text =  "\(tripNameValue!)"

        
    }
    
    // didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}
