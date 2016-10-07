//
//  PLANiTTests.swift
//  PLANiTTests
//
//  Created by MICHAEL WURM on 10/6/16.
//  Copyright © 2016 MICHAEL WURM. All rights reserved.
//

import XCTest
@testable import PLANiT

class PLANiTTests: XCTestCase {
    
    // MARK: PLANiT Tests
    
    // Tests to confirm that the User initializer returns when no user or password is provided
    
    func testUserInitialization() {
    
        // Success case
        let potentialUser = User(username: "John Smith", password: "abc123")
        XCTAssertNotNil(potentialUser)
        
        // Failure cases
        let noUsername = User(username: "", password: "abc123")
        XCTAssertNil(noUsername, "Empty username is invalid")
        
        let noPassword = User(username: "John Smith", password: "")
        XCTAssertNil(noPassword, "Empty password is invalid")
    }
    
}
