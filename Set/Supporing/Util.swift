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
    static var borderWidth: CGFloat = 2.0;
    static var cornerRadius: CGFloat = 8.0;
    
    enum theme: Int {
        case mainBackground = 1;
        case gridBackground = 2;
        case cardBackground = 3;
        case cardHilight = 4;
        case icon1 = 5;
        case icon2 = 6;
        case icon3 = 7;
        
        var color: UIColor {
            switch self {
            case .mainBackground:
                return #colorLiteral(red: 0.6, green: 0.3607843137, blue: 0.3607843137, alpha: 1);
            case .gridBackground:
                return #colorLiteral(red: 0.4470588235, green: 0.5254901961, blue: 0.6470588235, alpha: 1);
            case .cardBackground:
                return #colorLiteral(red: 0.8823529412, green: 0.8784313725, blue: 0.8392156863, alpha: 1);
            case .cardHilight:
                return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1);
            case .icon1:
                return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1);
            case .icon2:
                return #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1);
            case .icon3:
                return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
            }
        }
    }
    
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
