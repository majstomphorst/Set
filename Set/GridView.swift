//
//  GridView.swift
//  Set
//
//  Created by Maxim Stomphorst on 03/05/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    private lazy var grid = Grid(layout: Grid.Layout.aspectRatio(0.7), frame: self.bounds.insetBy(dx: cornerRadius, dy: cornerRadius));
    var cards = [SetCard]() {
        didSet {
            setNeedsLayout();
            setNeedsLayout();
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subviews.forEach { $0.removeFromSuperview() }
        
        grid = Grid(layout: Grid.Layout.aspectRatio(0.7),
                    frame: self.bounds.insetBy(dx: cornerRadius,
                                               dy: cornerRadius));
        grid.cellCount = cards.count;
        for i in 0..<grid.cellCount {
            if let gridItem = grid[i] {
                let cardView = SetCardView(frame: gridItem.insetBy(dx: 4, dy: 4));
                cardView.card = cards[i];
                
                cardView.backgroundColor = .clear;
                addSubview(cardView);
            }

        }
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius);
        roundedRect.addClip();
        UIColor.green.setFill();
        roundedRect.stroke()
    }
}
