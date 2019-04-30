//
//  SetCard.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation
import UIKit

struct SetCard: Equatable, CustomStringConvertible {
    
    let number: Number;
    let symbol: Symbol;
    let shading: Shading;
    let color: Color;
    
    static func ==(lhs: SetCard, rhs: SetCard) -> Bool {
        return (lhs.number == rhs.number &&
            lhs.symbol == rhs.symbol &&
            lhs.shading == rhs.shading &&
            lhs.color == rhs.color)
    }
    
    var description: String {
        return "number: \(number), symbol: \(symbol), shading: \(shading), color: \(color)\n"
    }
    
    init(with n: Int, _ c: Int, _ s: Int, _ f: Int) {
        self.number = Number(rawValue: n)!
        self.symbol = Symbol(rawValue: c)!
        self.shading = Shading(rawValue: s)!
        self.color = Color(rawValue: f)!
    }
    
    enum Number: Int, CustomStringConvertible {
        case one = 1;
        case two = 2;
        case three = 3;
        
        static var all = [Number.one, .two, .three];
        
        var description: String {
            switch self {
                case .one:
                    return "one"
                case .two:
                    return "two"
                case .three:
                    return "three"
            }
        }
    }
    
    enum Symbol: Int, CustomStringConvertible {
        case triangle
        case circle
        case square
        
        static var all = [Symbol.triangle, .circle, .square];
        
        var description: String {
            switch self {
            case .triangle:
                return "triangle"
            case .circle:
                return "circle"
            case .square:
                return "square"
            }
        }
    }
    
    enum Shading : Int, CustomStringConvertible {
        case solid = 1;
        case striped = 2;
        case open = 3;
        
        static var all = [Shading.solid, .striped, .open];
        
        var description: String {
            switch self {
            case .solid:
                return "solid"
            case .striped:
                return "striped"
            case .open:
                return "open"
            }
        }
    
    }
    
    enum Color : Int, CustomStringConvertible {
        case red = 1;
        case green = 2;
        case purple = 3;
        
        static var all = [Color.red, .green, .purple];
        
        var description: String {
            switch self {
            case .red:
                return "red"
            case .green:
                return "green"
            case .purple:
                return "purple"
            }
        }
    }
}
