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
//    
//    private var allTrips = [TripDataModel]()
//    private var currentTripData : (titles:[String], values:[String])?
//    private var currentTripIndex = 0
//    var currentTripCount = 0
//    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        //1
//        currentTripIndex = 0
//        
//        //2
//        allTrips = TripLibraryAPI.sharedInstance.getTrips()
//        
//        // 3
//        // the uitableview that presents the album data
//        existingTripsTable.delegate = self
//        existingTripsTable.dataSource = self
//        existingTripsTable.backgroundView = nil
        existingTripsTable.layer.cornerRadius = 5
//        view.addSubview(existingTripsTable!)
//        
//        self.showDataForTrips(tripIndex: currentTripIndex)
//        var currentTripCount = allTrips.count
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
//
//    // MARK: Functions
//    func showDataForTrips(tripIndex: Int) {
//        // defensive code: make sure the requested index is lower than the amount of albums
//        if (tripIndex < allTrips.count && tripIndex > -1) {
//            //fetch the album
//            let trip = allTrips[tripIndex]
//            // save the albums data to present it later in the tableview
//            currentTripData = trip
//        } else {
//            currentTripData = nil
//        }
//        // we have the data we need, let's refresh our tableview
//        existingTripsTable!.reloadData()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
    

}
