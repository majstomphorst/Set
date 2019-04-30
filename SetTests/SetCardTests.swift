//
//  SetCardTests.swift
//  SetCardTests
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import XCTest
@testable import Set

class SetCardTests: XCTestCase {
    
    func testCardEquatable() {
        
        let card1 = SetCard(with: 1, 1, 1, 1);
        
        let card2 = SetCard(with: 1, 1, 1, 1);
        
        let card3 = SetCard(with: 2, 1, 1, 1);
        let card4 = SetCard(with: 1, 2, 1, 1);
        let card5 = SetCard(with: 1, 1, 2, 1);
        
        XCTAssertTrue(card1 == card2, "card \(card1) and \(card2) should be the same");
        XCTAssertFalse(card1 == card3, "card \(card1) and \(card3) should not be the same");
        XCTAssertFalse(card1 == card4, "card \(card1) and \(card4) should not be the same");
        XCTAssertFalse(card1 == card5, "card \(card1) and \(card5) should not be the same");
    }
}
