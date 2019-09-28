//
//  RXBlocking.swift
//  RXTests
//
//  Created by mohamed hashem on 9/28/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import XCTest
@testable import RX
import RxSwift
import RxBlocking

class RXBlocking: XCTestCase {

    let ObserverBlocking = Observable.from([1,2,3,4,5,6,7,8,9,10])
    
    func testBlockingObserverAsync() {
        let dataResult = try! ObserverBlocking.toBlocking(timeout: 5).toArray()
        
        dataResult.forEach { (result) in
            print("Result is: ", result)
        }
    }
    
}
