//
//  Card.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation
import UIKit

struct Card: Equatable {
    let number: Number;
    let symbol: Symbol;
    let shading: Shading;
    let color: Color;
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (lhs.number == rhs.number &&
            lhs.symbol == rhs.symbol &&
            lhs.shading == rhs.shading &&
            lhs.color == rhs.color)
    }
    
    enum Number {
        case one
        case two
        case three
        
        static var all = [Number.one, .two, .three];
    }
    
    enum Symbol {
        case triangle
        case circle
        case square
        
        static var all = [Symbol.triangle, .circle, .square];
    }
    
    enum Shading {
        case solid;
        case striped;
        case open;
        
        static var all = [Shading.solid, .striped, .open];
    }
    
    enum Color {
        case red;
        case green;
        case purple;
        
        static var all = [Color.red, .green, .purple];
    }
}
