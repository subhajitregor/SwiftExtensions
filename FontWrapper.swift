
//
//  FontWrap.swift
//  
//
//  Created by subhajit halder on 12/10/17.
//

import Foundation
import UIKit

struct Font {
    
    enum FontName: String {
        case CeliasThin = "Celias-Thin"
        case CeliasBoldItalic = "Celias-BoldItalic"
        case CeliasBlack = "Celias-Black"
        case CeliasBold = "Celias-Bold"
        case Celias = "Celias"
        case CeliasLight = "Celias-Light"
        case CeliasLightItalic = "Celias-LightItalic"
        case CeliasHairlineItalic = "Celias-HairlineItalic"
        case CeliasMedium = "Celias-Medium"
        case CeliasHairline = "Celias-Hairline"
        case CeliasMediumItalic = "Celias-MediumItalic"
        case CeliasThinItalic = "Celias-ThinItalic"
        case CeliasBlackItalic = "Celias-BlackItalic"
        case CeliasItalic = "Celias-Italic"
    }
    
    enum StandardSize: Double {
        case h1 = 20.0
        case h2 = 18.0
        case h3 = 16.0
        case h4 = 14.0
        case h5 = 12.0
        case h6 = 10.0
    }
    
    enum FontType {
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItalic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    
    enum FontSize {
        case standard(StandardSize)
        case custom(Double)
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
                
            case .custom(let customSize):
                return customSize
                
            }
        }
    }
    
    var type: FontType
    var size: FontSize
    
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
    
}

extension Font {
    
    var instance: UIFont {
        var instanceFont: UIFont!
        
        switch type {
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
        case .systemItalic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
        case .systemWeighted(let weight):
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                             weight: UIFont.Weight(rawValue: CGFloat(weight)))
        case .monoSpacedDigit(let size, let weight):
            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                            weight: UIFont.Weight(rawValue: CGFloat(weight)))
        }
       
         return instanceFont
    }
    
    
}
