//
//  SetCardView.swift
//  Set
//
//  Created by Maxim Stomphorst on 02/05/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import UIKit

@IBDesignable
class SetCardView: UIView {
    var card: SetCardView {
        didSet {
            
        }
    }
    @IBInspectable var strokeWidth: CGFloat = 0
    @IBInspectable var fillColor: UIColor = UIColor.black
    @IBInspectable var strokeColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let rectangle = bounds.insetBy(dx: strokeWidth / 2, dy: strokeWidth / 2)
        
        context.setFillColor(fillColor.cgColor)
        context.setStrokeColor(strokeColor.cgColor)
        context.setLineWidth(strokeWidth)
        
        context.addEllipse(in: rectangle)
        context.drawPath(using: .fillStroke)
    }
    
    
}
