//
//  TripList.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/11/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class TripListViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var existingTripsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        existingTripsTable.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
