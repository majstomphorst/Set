//
//  SetGameTest.swift
//  SetTests
//
//  Created by Maxim Stomphorst on 01/05/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation
import XCTest

@testable import Set

class SetGameTest: XCTestCase {
    
    func testInit() {
        let setGame = SetGame();
        let deckOnTable = setGame.deckOnTable;
        
        XCTAssertFalse(deckOnTable.count == constDeck.empty.rawValue, "should not be empty");
        XCTAssertTrue(deckOnTable.count == constDeck.deckOntabelInitValue.rawValue, "twelve cards on table");
    }
    
    func testIsSet() {
        
        // cards are a set
        let card1 = SetCard(with: 1, 1, 1, 1);
        let card2 = SetCard(with: 2, 1, 1, 1);
        let card3 = SetCard(with: 3, 1, 1, 1);
        
        // card are a set
        let card4 = SetCard(with: 1, 1, 3, 1);
        let card5 = SetCard(with: 2, 1, 1, 1);
        let card6 = SetCard(with: 3, 1, 2, 1);
        
        // card are not a set
        let card7 = SetCard(with: 1, 1, 3, 1);
        let card8 = SetCard(with: 2, 1, 1, 1);
        let card9 = SetCard(with: 3, 1, 2, 2);
        
        let test1 = SetGame.isSet(cards: [card1,card2,card3]);
        let test2 = SetGame.isSet(cards: [card4,card5,card6]);
        let test3 = SetGame.isSet(cards: [card7,card8,card9]);
        
        XCTAssertTrue(test1,"");
        XCTAssertTrue(test2,"");
        XCTAssertFalse(test3,"");
    }
    
    func testFindSet() {
        let setGame = SetGame();
        
        _ = setGame.findSetOnTable();
    }
    
    
}
