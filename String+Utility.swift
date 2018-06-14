
//
//  NSString+Utility.swift
//  Late Lateef
//
//  Created by subhajit halder on 21/01/17.
//  Copyright © 2017 Tanmoy. All rights reserved.
//

import Foundation

extension String {
    func trimString() -> String {
        var trimmedStr: String = ""
        var str_Trimmed: String = (self as NSString).replacingCharacters(in: (self as NSString).range(of:"^\\s*", options: .regularExpression), with: "")
        if str_Trimmed.characters.count > 0 {
            trimmedStr = (str_Trimmed as NSString).replacingCharacters(in: (str_Trimmed as NSString).range(of:"\\s*$", options: .regularExpression), with: "")
        }
        return trimmedStr
    }
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    
    func stringsMatchingRegularExpression(expression exp:String) -> [String]? {
        var strArray:[String]?
        var rangeArray:[NSRange]?
        let strLength = self.characters.count
        var startOfRange = 0
        do {
            let regexString = try NSRegularExpression(pattern: exp, options: [])
            while startOfRange <= strLength {
                let rangeOfMatch = regexString.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(startOfRange, strLength-startOfRange))
                if let rArray = rangeArray {
                    rangeArray = rArray + [rangeOfMatch]
                }
                else {
                    rangeArray = [rangeOfMatch]
                }
                startOfRange = rangeOfMatch.location+rangeOfMatch.length
                
                
            }
            if let ranArr = rangeArray {
                for r in ranArr {
                    
                    if !NSEqualRanges(r, NSMakeRange(NSNotFound, 0)) {
                        self.index(startIndex, offsetBy: r.length)
                        
                        let r =  self.index(startIndex, offsetBy:r.location)..<self.index(startIndex, offsetBy:r.location + r.length)
                        
                        // return the value
                        let substringForMatch = self.substring(with: r)
                        if let sArray = strArray {
                            strArray = sArray + [substringForMatch]
                        }
                        else {
                            strArray = [substringForMatch]
                        }
                        
                    }
                    
                }
            }
        }
        catch {
            // catch errors here
        }
        
        return strArray
    }
}

extension Character
{
    func unicodeScalar() -> UnicodeScalar
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex]
    }
}

extension String {
    func makeDateFormat(from: String, to: String) -> String {
        var str = ""
        
        let df = DateFormatter()
        df.dateFormat = from
        
        let date = df.date(from: self.trimString())
        
        df.dateFormat = to
        
        if date != nil {
            str = df.string(from: date!)
        } else {
            str = self
        }
        
        
        return str
    }
}
