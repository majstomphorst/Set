//
//  SetCardDeckTests.swift
//  SetTests
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation
import XCTest

@testable import Set

class SetCardDeckTests: XCTestCase {
    
    func testInit() {
        let testDeck = SetCardDeck();
        
        XCTAssertTrue(testDeck.count == 81, "deck should be 81 big");
    }
}
