//
//  TestMockData.swift
//  RXTests
//
//  Created by mohamed hashem on 9/28/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import XCTest
@testable import RX

class TestMockData: XCTestCase {
    
    var viewControllertest = MockData()
    
    func testLoginDatatest() {
        let expected = expectation(description: "Mostafa hashem")
        
        viewControllertest.runLog(password: "123", name: "hashem") { (result) in
            if result {
                XCTFail()
                return
            } else {
                expected.fulfill()
            }
        }
        self.waitForExpectations(timeout: 4, handler: nil)
    }
}


class MockData {
    var loginRsult = false
}

extension MockData: testMockLogin {
    func runLog(password: String, name: String, completionHanbdelar: @escaping ((Bool) -> Void)) {
        loginRsult = true
        
        if password == "123", name == "hashem" {
            completionHanbdelar(false)
        } else {
            completionHanbdelar(true)
        }
    }
}
