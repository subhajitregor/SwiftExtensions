//
//  NSDictionary+Utility.swift
//  
//
//  Created by subhajit halder on 21/02/17.
//

import Foundation

extension NSDictionary {
    
    func toStringFrom(key akey: String) -> String {
        if let str = self[akey] as? String {
            return str
        } else if let str = self[akey] as? Int {
            return "\(str)"
        } else if let str = self[akey] as? Double {
            return "\(str)"
        } else {
            return ""
        }
    }
    func toIntFrom(key akey: String) -> Int {
        if let str = self[akey] as? Int {
            return str
        } else {
            return 0
        }
    }
    func toFloatFrom(key akey: String) -> Float {
        if let str = self[akey] as? Float {
            return str
        } else {
            return 0.0
        }
    }
    
    func toDoubleFrom(key akey: String) -> Double {
        if let str = self[akey] as? Double {
            return str
        } else {
            return 0.0
        }
    }
    
    func toNSArrayFrom(key aKey: String) -> NSArray {
        if let arr = self[aKey] as? NSArray {
            return arr
        } else {
            return []
        }
    }
    
    func toBoolFrom(key aKey: String) -> Bool {
        
        if let arr = self[aKey] as? Bool {
            return arr
        } else {
            return false
        }
    }
    
}
