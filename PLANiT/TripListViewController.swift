//
//  TripList.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/11/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class TripListViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if DataContainerSingleton.sharedDataContainer.usertrippreferences == nil {
           return 0
        }
        else {
        return (DataContainerSingleton.sharedDataContainer.usertrippreferences?.count)!
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "existingTripViewPrototypeCell", for: indexPath) as! ExistingTripTableViewCell
        
        if DataContainerSingleton.sharedDataContainer.usertrippreferences == nil {
            existingTripsTable.isHidden = true
            return (cell)
        }
        else {
            let addedRow = indexPath.row
            
            cell.existingTripTableViewImage.image = #imageLiteral(resourceName: "NYE")
            cell.existingTripTableViewLabel.text = DataContainerSingleton.sharedDataContainer.usertrippreferences?[addedRow].object(forKey: "trip_name") as? String
            existingTripsTable.isHidden = false
            return (cell)

        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        DataContainerSingleton.sharedDataContainer.currenttrip = indexPath.row
    }
    
    
    // MARK: Outlets
    @IBOutlet weak var existingTripsTable: UITableView!
    @IBOutlet weak var noTripsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if DataContainerSingleton.sharedDataContainer.usertrippreferences == nil {
            existingTripsTable.isHidden = true
            noTripsLabel.isHidden = false
            DataContainerSingleton.sharedDataContainer.currenttrip = 0
            }
        else {
            existingTripsTable.isHidden = false
            noTripsLabel.isHidden = true
            existingTripsTable.tableFooterView = UIView()
            existingTripsTable.layer.cornerRadius = 5
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
}
