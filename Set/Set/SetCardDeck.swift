//
//  SetCardDeck.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation

struct SetCardDeck : CustomStringConvertible {
    
    private(set) var cards = [SetCard]();
    
    /// a draw a SetCard function
    mutating func draw(amount: validDraws = .three) -> [SetCard]? {
        // check if here are enough cards
        if cards.count < amount.rawValue { return nil }
        
        var returnArray = [SetCard]()
        for _ in 1...amount.rawValue {
            returnArray.append(cards.remove(at: cards.count.arc4Random));
        }
        return returnArray;
    }
    
    var count: Int {
        return cards.count
    }
    
    enum validDraws: Int {
        case three = 3
        case twelve = 12
    }
    
    /// Creates a deck with all the possible cards
    /// 3^4 = 81
    init() {
        let rangeOfThree = 1...3
        
        for number in rangeOfThree {
            for color in rangeOfThree {
                for shape in rangeOfThree {
                    for fill in rangeOfThree {
                        let card = SetCard(with: number, color, shape, fill)
                        cards.append(card)
                    }
                }
            }
        }
    }
    
    /// Create a humanly readible string representation
    /// - Returns: string("card\n card\n")
    var description: String {
        var returnString = ""
        for card in cards {
            returnString += "\(card)\n"
        }
        return returnString
    }
    
}
