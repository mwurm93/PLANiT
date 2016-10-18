//
//  DataModel.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/6/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class User: NSObject {
    
//    // MARK: Types
//    struct PropertyKey {
//        static let firstNameKey = "firstname"
//        static let lastNameKey = "lastname"
//        static let emailAddressKey = "email"
//        static let passwordKey = "password"
//    }
    
    // MARK: Properties
    
    var userFirstName: String
    var userLastName: String
    var userEmailAddress: String
    var userPassword: String

    // MARK: Initialization
    
    init?(userFirstName: String, userLastName: String, userEmailAddress: String, userPassword: String) {
        
        // Initialize stored properties
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.userEmailAddress = userEmailAddress
        self.userPassword = userPassword

        
        // Initialization should fail if there is no username or password
        if userPassword.isEmpty || userEmailAddress.isEmpty || userFirstName.isEmpty || userLastName.isEmpty {
            return nil
        }
     }
    
//    // MARK: NSCoding
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encode(userFirstName, forKey: PropertyKey.firstNameKey)
//        aCoder.encode(userLastName, forKey: PropertyKey.lastNameKey)
//        aCoder.encode(userEmailAddress, forKey: PropertyKey.emailAddressKey)
//        aCoder.encode(userPassword, forKey: PropertyKey.passwordKey)
//    }
    
}
