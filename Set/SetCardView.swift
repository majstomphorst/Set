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
    var state = State.NotSelected;
    
    private lazy var grid = Grid.init(layout: .dimensions(rowCount: 1, columnCount: 3), frame: bounds);
    
    override func draw(_ rect: CGRect) {
        updateViewForState();

        /// drawing the shape
        // get current draw rect
        let rect = bounds.insetBy(dx: cornerOffset, dy: cornerOffset);
        // create 3 rectengels to draw the shape in
        grid = Grid.init(layout: .dimensions(rowCount: 3, columnCount: 1), frame: rect);
        // grid.cellCount = card.number.rawValue
        
        for i in 0..<card.number.rawValue {
            let square = centerObjectAndMakeSquare(rect: grid[i]!)
            let shape = getShape(in: square.insetBy(dx: cornerOffset,
                                                    dy: cornerOffset));
            setStrokeAndFillColor();
            
            shape.lineWidth = 1;
            switch card.shading {
            case .open:
                shape.stroke();
            case .solid:
                shape.fill();
            case .striped:
                drawStripes(in: shape, within: grid[i]!);
            }
        }
        
        
    }
    
    private func updateViewForState() {
        switch state {
        case .NotSelected:
            drawBackground(with: .white);
        case .Selected:
            drawBackground(with: .purple);
        case .Hint:
            drawBackground(with: .purple);
        }
    }
    
    private func drawStripes(in shapPath: UIBezierPath, within bounds: CGRect ) {
        
        let numberOfStripes = Int(bounds.width / 2);
        
        UIGraphicsGetCurrentContext()?.saveGState();
        shapPath.addClip();
        
        for line in 0..<numberOfStripes {
            let xCoord = CGFloat(line);
            
            shapPath.move(to: CGPoint(x: xCoord * 3, y: 0))
            shapPath.addLine(to: CGPoint(x: xCoord * 3, y: bounds.maxY))
        }
        
        shapPath.stroke();
        UIGraphicsGetCurrentContext()?.restoreGState()
    }
    
    
    private func centerObjectAndMakeSquare(rect: CGRect) -> CGRect {
        let midXPoint = rect.midX - (rect.width/4)
        return CGRect(x: midXPoint, y: rect.minY,
                            width: rect.height, height: rect.height)
    }
    
    private func drawBackground(with color: UIColor) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius);
        roundedRect.addClip();
        color.setFill();
        roundedRect.fill();
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
    
    private func setStrokeAndFillColor() {
        switch card.color {
        case .green:
            #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).setFill();
            #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).setStroke();
        case .purple:
            #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1).setFill();
            #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1).setStroke();
        case .red:
            #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).setFill();
            #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).setStroke();
        }
    }
    
    
}

