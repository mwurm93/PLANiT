//
//  DataModel.swift
//  PLANiT
//
//  Created by MICHAEL WURM on 10/6/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import UIKit

class User {
    // MARK: Properties
    
    var username: String
    var password: String
    
    // MARK: Initialization
    
    init?(username: String, password: String) {
        
        // Initialize stored properties
        self.username = username
        self.password = password
        
        // Initialization should fail if there is no username or password
        if username.isEmpty || password.isEmpty {
            return nil
        }
     }
}
