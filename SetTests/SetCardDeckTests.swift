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
    
    enum constDeck: Int {
        case completeDeck = 81;
        case empty = 0;
        case sixDrawTwelveLeft = 9;
    }
    
    func testInit() {
        let testDeck = SetCardDeck();
        
        XCTAssertTrue(testDeck.count == 81, "deck should be 81 big result \(testDeck.count)");
    }
    
    func testDrawThree() {
        let completeDeck = constDeck.completeDeck.rawValue;
        let drawThree = SetCardDeck.validDraws.three.rawValue;
        let amountOfDrawPossible = completeDeck / drawThree;
        
        var testDeck = SetCardDeck();
        
        for i in 1...amountOfDrawPossible {
            
            let threeCards = testDeck.draw();
            
            XCTAssertNotNil(threeCards)
            XCTAssertTrue(threeCards!.count == drawThree, "deck should be 81 big result \(testDeck.count)");
            XCTAssertTrue(testDeck.count == completeDeck - (drawThree * i), "String");
        }
        XCTAssertTrue(testDeck.count == constDeck.empty.rawValue ,"deck should be empty");
        XCTAssertNil(testDeck.draw());
    }
    
    func testDrawTwelve() {
        let completeDeck = constDeck.completeDeck.rawValue;
        let drawTwelve = SetCardDeck.validDraws.twelve.rawValue;
        let amountOfDrawPossible = completeDeck / drawTwelve;

        var testDeck = SetCardDeck();

        for i in 1...amountOfDrawPossible {

            let twelveCards = testDeck.draw(amount: .twelve);

            XCTAssertNotNil(twelveCards)
            XCTAssertTrue(twelveCards!.count == drawTwelve, "deck should be 81 big result \(testDeck.count)");
            XCTAssertTrue(testDeck.count == completeDeck - (drawTwelve * i), "String");
        }
        XCTAssertTrue(testDeck.count == constDeck.sixDrawTwelveLeft.rawValue ,"deck should be ");
        XCTAssertNil(testDeck.draw(amount: .twelve),"deck cant return 12");
        
        XCTAssertNotNil(testDeck.draw());
        XCTAssertNotNil(testDeck.draw());
        XCTAssertNotNil(testDeck.draw());
        XCTAssertNil(testDeck.draw());
    }
    
}
