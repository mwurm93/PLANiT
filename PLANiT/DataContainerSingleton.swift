//
//  DataContainerSingleton.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/18/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import Foundation
import UIKit

struct DefaultKeys {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let emailAddress = "emailAddress"
        static let password = "password"
    }


class DataContainerSingleton {
    
    static let sharedDataContainer = DataContainerSingleton()
    
    var firstName: String?
    var lastName: String?
    var emailAddress: String?
    var password: String?
    
    var goToBackgroundObserver: AnyObject?
    
    init() {
        let defaults = UserDefaults.standard
        //-----------------------------------------------------------------------------
        //This code reads the singleton's properties from NSUserDefaults.
        //edit this code to load your custom properties
        firstName = defaults.object(forKey: DefaultKeys.firstName) as! String?
        lastName = defaults.object(forKey: DefaultKeys.lastName) as! String?
        emailAddress = defaults.object(forKey: DefaultKeys.emailAddress) as! String?
        password = defaults.object(forKey: DefaultKeys.password) as! String?

        //-----------------------------------------------------------------------------
        
        //Add an obsever for the UIApplicationDidEnterBackgroundNotification.
        //When the app goes to the background, the code block saves our properties to NSUserDefaults.
        goToBackgroundObserver = NotificationCenter.default.addObserver(
            forName: NSNotification.Name.UIApplicationDidEnterBackground,
            object: nil,
            queue: nil)
        {
            (note: Notification!) -> Void in
            let defaults = UserDefaults.standard
            //-----------------------------------------------------------------------------
            //This code saves the singleton's properties to NSUserDefaults.
            //edit this code to save your custom properties
            defaults.set( self.firstName, forKey: DefaultKeys.firstName)
            defaults.set( self.lastName, forKey: DefaultKeys.lastName)
            defaults.set( self.emailAddress, forKey: DefaultKeys.emailAddress)
            defaults.set( self.password, forKey: DefaultKeys.password)
            //-----------------------------------------------------------------------------
            
            //Tell NSUserDefaults to save to disk now.
            defaults.synchronize()
        }
    }


}
