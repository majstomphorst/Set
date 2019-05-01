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
        var setGame = SetGame();
        
        let deckOnTable = setGame.deckOnTable;
        
        XCTAssertFalse(deckOnTable.count == constDeck.empty.rawValue, "should not be empty");
        XCTAssertTrue(deckOnTable.count == constDeck.deckOntabelInitValue.rawValue, "twelve cards on table");
    }
    
    
}
