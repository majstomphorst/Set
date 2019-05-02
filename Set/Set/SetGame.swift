//
//  SetGame.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation

struct SetGame {
    var deckCount: Int { get { return deck.count; } }
    
    private var deck = SetCardDeck();
    lazy var deckOnTable: [SetCard] = deck.draw(amount: .twelve) ?? [];
    private(set) var beingMatched = [SetCard]();
    private(set) var matched = [SetCard]();
    
    /// ???
    private typealias ProperyFunction<T:Hashable> = (SetCard) -> T;
    
    /// check if values are the same of diffrent
    ///
    /// - Parameters: object that is Hashable
    /// - Returns: true if all propertys are the same or all diffrent
    private static func isSetOfProperties<T:Hashable>(cards: [SetCard], function: ProperyFunction<T>) -> Bool {
        
        let count = Dictionary(grouping: cards, by: function).count;
        
        // count = 1: so 3 the same propertys
        // count = 3: so 3 different propertys
        return count == 1 || count == cards.count;
    }
    
    /// check if three cards make a set
    ///
    /// - Parameters: a list of SetCards
    /// - Returns: true if cards make a set false otherwise
    public static func isSet(cards: SetCard...) -> Bool {
        if (cards.count != 3) { return false; }
        
        return isSetOfProperties(cards: cards) { (card) -> SetCard.Number
                in return card.number;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Symbol in return card.symbol;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Shading in return card.shading;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Color
                in return card.color;
        };
    }
    
    /// find a set of card in the deck that is on table
    ///
    /// - Returns: a set of three card a solution
    public mutating func findSetOnTable() -> [SetCard]? {
        var solution = [SetCard]();
        for i in 0..<deckOnTable.count - 2 {
            for j in (i+1)..<deckOnTable.count - 1 {
                for k in (j+1)..<deckOnTable.count {
                    let card1 = deckOnTable[i]
                    let card2 = deckOnTable[j]
                    let card3 = deckOnTable[k]
                    if (SetGame.isSet(cards: card1,card2,card3)) {
                        solution.append(contentsOf: [card1,card2,card3])
                        return solution
                    }
                }
            }
        }
        return solution;
    }
}
