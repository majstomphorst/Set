//
//  Util.swift
//  Set
//
//  Created by Maxim Stomphorst on 30/04/2019.
//  Copyright © 2019 Maxim Stomphorst. All rights reserved.
//

import Foundation
import UIKit

struct Util {
    
    public static func getCirclePath(in bounds: CGRect) -> UIBezierPath {
        return UIBezierPath(ovalIn: bounds);
    }
    
    public static func getSquarePath(in bounds: CGRect) -> UIBezierPath {
        return UIBezierPath(rect: bounds);
    }
    
    public static func getTrianglePath(in bounds: CGRect) -> UIBezierPath {
        let path = UIBezierPath();
        path.move(to: CGPoint(x: bounds.midX, y: bounds.minY));
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY));
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY));
        path.close();
        return path;
    }
    
    
}
