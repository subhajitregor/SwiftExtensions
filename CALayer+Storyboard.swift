
//
//  CALayer+Storyboard.swift
//  Late Lateef
//
//  Created by Tanmoy Khanra on 22/12/16.
//  Copyright © 2016 Tanmoy. All rights reserved.
//

import Foundation

import UIKit

extension CALayer {
    
    func setBorderColorFromUIColor(_ color: UIColor) {
        self.borderColor = color.cgColor
    }
    
    
}
