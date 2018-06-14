
//
//  CALayer+Storyboard.swift
/
//
//  Created by Subhajit Halder on 22/12/16.
//  
//

import Foundation

import UIKit

extension CALayer {
    
    func setBorderColorFromUIColor(_ color: UIColor) {
        self.borderColor = color.cgColor
    }
    
    
}
