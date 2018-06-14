//
//  UIColor+Utility.swift
//
//  Created by subhajit halder on 12/02/17.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    static var themeGreen: UIColor { get { return UIColor(hex: "44b12b") } }
    
    static var themeRed: UIColor { get { return UIColor(hex: "d0003b") } }
    
    static var errorRed: UIColor { get {return UIColor(hex: "d0003b") } }
    
    static var statusGreen: UIColor  { get { return UIColor(red:0.26, green:0.63, blue:0.28, alpha:1.0) } }
    
    static var statusRed: UIColor { get { return UIColor(red:0.90, green:0.22, blue:0.21, alpha:1.0) } }
    
    static var statusBlue: UIColor { get { return UIColor(red:0.12, green:0.53, blue:0.90, alpha:1.0) } }

    static var statusOrange: UIColor { get { return UIColor(red:0.98, green:0.55, blue:0.00, alpha:1.0) } }

    

}


