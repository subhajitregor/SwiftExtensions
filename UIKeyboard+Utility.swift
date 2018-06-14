//
//  UIKeyboard+Utility.swift
//
//  Created by Subhajit Halder on 20/02/18.
//

import Foundation
//import UIKit

extension UITextField {
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
   
    
    func addDoneButtonOnKeyboard() {
        if self.keyboardType == UIKeyboardType.numberPad {
            let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
            toolbar.barStyle = UIBarStyle.default
            
            
            let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
            let barItems =  [flex, done]
            toolbar.items = barItems
            toolbar.sizeToFit()
            
            self.inputAccessoryView = toolbar
            
        }
        
        
    }
    
    @objc func done() {
        self.resignFirstResponder()
    }
}
