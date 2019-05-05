//
//  GridView.swift
//  Set
//
//  Created by Maxim Stomphorst on 03/05/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

protocol LayoutViews: class {
    func updateViewFromModel()
}

class GridView: UIView {
    
    weak var delegate: LayoutViews?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate?.updateViewFromModel();
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius);
        roundedRect.addClip();
        
        Util.theme.gridBackground.color.setFill()
        roundedRect.fill();
        
        Util.theme.cardBackground.color.setStroke();
        roundedRect.stroke();
        
    }
}
