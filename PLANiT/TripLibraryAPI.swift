//
//  TripLibraryAPI.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 11/28/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

//import UIKit
//
//class TripLibraryAPI: NSObject {
//    
//    private let persistencyManager: PersistencyManager
//    private let httpClient: HTTPClient
//    private let isOnline: Bool
//    
//    //1
//    class var sharedInstance: TripLibraryAPI {
//        //2
//        struct Singleton {
//            //3
//            static let instance = TripLibraryAPI()
//        }
//        //4
//        return Singleton.instance
//    }
//    
//    override init() {
//        persistencyManager = PersistencyManager()
//        httpClient = HTTPClient()
//        isOnline = false
//        
//        super.init()
//    }
//    
//    func getTrips() -> [TripDataModel] {
//        return persistencyManager.getTrips()
//    }
//    
//    func addTrip(trip: TripDataModel, index: Int) {
//        persistencyManager.addTrip(trip: trip, index: index)
//        if isOnline {
//            httpClient.postRequest("/api/addTrip", body: TripDataModel.description())
//        }
//    }
//    
//    func deleteTrip(index: Int) {
//        persistencyManager.deleteTripAtIndex(index: index)
//        if isOnline {
//            httpClient.postRequest("/api/deleteTrip", body: "\(index)")
//        }
//    }
//
//    
//}
