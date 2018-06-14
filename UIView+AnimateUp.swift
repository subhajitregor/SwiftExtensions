//
//  UIView+AnimateUp.swift
//
//  Created by subhajit halder on 01/10/16.
//

import Foundation
import UIKit

extension UIView {

    func animateUpToTargetYOrigin(with yValue: CGFloat) {
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, queue: OperationQueue.main) { (note) in
            
            var yOrigin : CGFloat?
            yOrigin = 0
            let keyboardOr = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.origin.y
            if yValue > keyboardOr! {
                yOrigin = yValue - keyboardOr!
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                    self.frame = CGRect(x: self.frame.origin.x, y: -yOrigin!, width: self.frame.size.width, height: self.frame.size.height)

                self.layoutIfNeeded()
            })
            
            
            
        }
        
    }
    
}

extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 10, y: self.center.y)//NSValue(CGPoint(x: self.center.x - 10, y: self.center.y))//CGPoint(self.center.x - 10, self.center.y))
        animation.toValue = CGPoint(x: self.center.x + 10, y: self.center.y)// NSValue(CGPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
}


/*
 
 - (void)animateUpToTargetYOrigin:(CGFloat)yValue
 {
 
 [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardDidChangeFrameNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
 CGFloat yOrigin = 0;
 CGFloat keyboardOr = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
 if (yValue > keyboardOr) {
 yOrigin = yValue - keyboardOr;
 }
 [UIView animateWithDuration:0.3f animations:^{
 //            if (up) {
 self.frame = CGRectMake(self.frame.origin.x, -yOrigin, self.frame.size.width, self.frame.size.height);
 //            }
 //            else
 //            {
 //                self.frame = CGRectMake(self.frame.origin.x, 0, self.frame.size.width, self.frame.size.height);
 //            }
 
 }];
 
 // NSLog(@"%f  yo yo", [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y);
 }];
 
 
 
 }
 
 */
