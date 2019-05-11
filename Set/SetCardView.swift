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
        case notSelected;
        case selected;
        case hint;
    }

    var card: SetCard? {
        didSet {
            setNeedsDisplay();
        }
    }
    
    var state = State.notSelected {
        didSet {
            updateViewForState();
        }
    }
    
    override func draw(_ rect: CGRect) {
        // create 3 rectengels to draw the shape in
        let grid = Grid.init(layout: .dimensions(rowCount: 3, columnCount: 1), frame: bounds.insetBy(dx: 8.0, dy: 8.0));
        
        if let card = card {
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
    }
    
    private func updateViewForState() {
        switch state {
        case .notSelected:
            layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .selected:
            layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
        case .hint:
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.5
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            flash.autoreverses = true
            flash.repeatCount = 3
            layer.add(flash, forKey: nil)
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
    
    /// returns a symbol within the given bounds
    ///
    /// - Parameters: the bounds of the object
    /// - Returns: a UIBeziePath of the chape
    private func getShape(in bounds: CGRect) -> UIBezierPath {
        if card != nil {
            switch card!.symbol {
            case .circle:
                return Util.getCirclePath(in: bounds);
            case .square:
                return Util.getSquarePath(in: bounds);
            case.triangle:
                return Util.getTrianglePath(in: bounds);
            }
        }
        return Util.getTrianglePath(in: bounds);
    }
    
    private func setStrokeAndFillColor() {
        if card != nil {
            switch card!.color {
            case .green:
                Theme.icon1.setFill()
                Theme.icon1.setStroke()
            case .purple:
                Theme.icon2.setFill()
                Theme.icon2.setStroke()
            case .red:
                Theme.icon3.setFill()
                Theme.icon3.setStroke()
            }
        }
    }
    
    private func setBasicLayoutForBorder () {
        backgroundColor = Theme.cardBackground;
        layer.borderWidth = Metric.borderWidth;
        layer.cornerRadius = Metric.cornerRadius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        setBasicLayoutForBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
        setBasicLayoutForBorder()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setNeedsLayout()
    }

}
