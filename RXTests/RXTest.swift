//
//  RXTest.swift
//  RXTests
//
//  Created by mohamed hashem on 9/28/19.
//  Copyright © 2019 mohamed hashem. All rights reserved.
//

import XCTest
@testable import RX
import RxSwift
import RxTest

class RXTest: XCTestCase {
    
    private let disposed = DisposeBag()
    
    func testRXtest() {
        let scheduler = TestScheduler(initialClock: 0)
        
        // Mock data to emit
        let observerInput = scheduler.createHotObservable([
            .next(150, "m"),
            .next(210, "o"),
            .next(220, "h"),
            .next(230, "a"),
            .next(240, "m"),
            .completed(300)
        ])
        
       // let resultObserver = scheduler.start { observerInput.map{ $0 }}
        let resultObserver =  scheduler.start { () -> Observable<String> in
            return observerInput.asObservable()
        }
        
        // tested result data
        let correctMessages = Recorded.events(
            .next(210, "o"),
            .next(220, "h"),
            .next(230, "a"),
            .next(240, "m"),
            .completed(300)
        )
        
        // start and virtuall time to subscribe
        let correctSubscriptions = [
            Subscription(200, 300)
        ]
        
        
        XCTAssertEqual(resultObserver.events, correctMessages)
        XCTAssertEqual(observerInput.subscriptions, correctSubscriptions)
    }
    
}
