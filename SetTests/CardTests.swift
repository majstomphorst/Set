//
//  CardTests.swift
//  CardTests
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import XCTest
@testable import Set

class CardTests: XCTestCase {
    
    func testCardEquatable() {
        
        let card1 = Card(number: .one, symbol: .circle, shading: .open, color: .green);
        
        let card2 = Card(number: .one, symbol: .circle, shading: .open, color: .green);
        
        let card3 = Card(number: .two, symbol: .circle, shading: .open, color: .green);
        
        let card4 = Card(number: .one, symbol: .square, shading: .solid, color: .green);
        let card5 = Card(number: .one, symbol: .square, shading: .open, color: .red);
        
        XCTAssertTrue(card1 == card2, "card 'one' and 'two' should be the same");
        XCTAssertFalse(card1 == card3, "card 'one' and 'three' should not be the same");
        XCTAssertFalse(card1 == card4, "card 'one' and 'four' should not be the same");
        XCTAssertFalse(card1 == card5, "card 'four' and 'five' should not be the same");
    }
}
