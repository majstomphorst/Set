//
//  SetCardView.swift
//  Set
//
//  Created by Maxim Stomphorst on 02/05/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

@IBDesignable class SetCardView: UIView {
    
    enum State {
        case NotSelected;
        case Selected;
        case Hint;
    }

    var card: SetCard = SetCard(with: 1, 1, 1, 1);
    var state = State.Selected;
    private lazy var grid = Grid.init(layout: .dimensions(rowCount: 1, columnCount: 3), frame: bounds);
    
    override func draw(_ rect: CGRect) {
        
        // draw background
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius);
        roundedRect.addClip();
        UIColor.white.setFill();
        roundedRect.fill();
        
        /// drawing the shape
        // get current draw rect
        let rect = bounds.insetBy(dx: cornerOffset, dy: cornerOffset);
        // create 3 rectengels to draw the shape in
        grid = Grid.init(layout: .aspectRatio(2.2), frame: rect);
        grid.cellCount = 3;
        
        for i in 0..<grid.cellCount {
            let rect2 = grid[i]!
            let midXPoint = rect2.midX - (rect2.width/5)
            let square = CGRect(x: midXPoint, y: rect2.minY,
                                width: rect2.height, height: rect2.height)
            
            let shape = getShape(in: square);
            setFillColor();
            shape.lineWidth = 1;
            shape.fill();
            shape.stroke();
        }
    }
    
    
    
    /// returns a simbol within the given bounds
    ///
    /// - Parameters: the bounds of the object
    /// - Returns: a UIBeziePath of the chape
    private func getShape(in bounds: CGRect) -> UIBezierPath {
        switch card.symbol {
            case .circle:
                return Util.getCirclePath(in: bounds);
            case .square:
                return Util.getSquarePath(in: bounds);
            case.triangle:
                return Util.getTrianglePath(in: bounds);
        }
    }
    
    private func setFillColor() {
        switch card.color {
        case .green:
            #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).setFill();
        case .purple:
            #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1).setFill();
        case .red:
            #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).setFill();
        }
    }
    
    
}

