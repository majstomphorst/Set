//
//  SetGame.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation

struct SetGame {
    var deckCount: Int {
        get {
            return deck.count;
        }
    }
    
    private var deck = SetCardDeck();
    lazy var deckOnTable: [SetCard] = deck.draw(amount: .twelve) ?? [];
    private(set) var beingMatched = [SetCard]();
    private(set) var matched = [SetCard]();
    
    
    
    private typealias ProperyFunction<T:Hashable> = (SetCard) -> T;
    
    private static func isSetOfProperties<T:Hashable>(cards: [SetCard], function: ProperyFunction<T>) -> Bool {
        let count = Dictionary(grouping: cards, by: function).count;
        return count == 1 || count == cards.count;
    }
    public static func isSet(cards: SetCard...) -> Bool {
        
        return isSetOfProperties(cards: cards) { (card) -> SetCard.Number in
            return card.number;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Symbol in
                return card.symbol;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Shading in
                return card.shading;
            } && isSetOfProperties(cards: cards) { (card) -> SetCard.Color in
                return card.color;
        };
    }
    
}
