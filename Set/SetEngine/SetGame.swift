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
    public var beingMatched = [SetCard]();
    public var matched = [SetCard]();
    public var hint = [SetCard]();
    
    public mutating func dealThreeMoreCards() {
        if let cards = deck.draw() {
            deckOnTable.append(contentsOf: cards);
        }
    }
    
    public mutating func chooseCard(card: SetCard) {
        
        let index = beingMatched.firstIndex(of: card);
        if index == nil {
            beingMatched.append(card);
        } else {
            beingMatched.remove(at: index!);
        }
    
        if beingMatched.count >= 3 {
            
            // is there a set?
            if (SetGame.isSet(cards: beingMatched)) {
                matched.append(contentsOf: beingMatched);
                let copyBeingMatched = beingMatched;
                deckOnTable.removeAll { copyBeingMatched.contains($0) }
            }
            
            beingMatched.removeAll();
            
            if (deckOnTable.count <= 9) {
                
                if let newCards = deck.draw() {
                    deckOnTable.append(contentsOf: newCards);
                }
            }
        }
        
    }
    
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
    public static func isSet(cards: [SetCard]) -> Bool {
        if (cards.count != 3) { return false; }
        
        return isSetOfProperties(cards: cards) { (card) -> SetCard.Number
                in return card.number;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Symbol
                in return card.symbol;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Shading
                in return card.shading;
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
                    let cards = [deckOnTable[i],deckOnTable[j],deckOnTable[k]]

                    if (SetGame.isSet(cards: cards)) {
                        solution.append(contentsOf: cards)
                        return solution
                    }
                }
            }
        }
        return solution;
    }
}
