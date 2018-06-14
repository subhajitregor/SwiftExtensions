//
//  UIScrollView+Keyboard.swift
//  Late Lateef
//
//  Created by subhajit halder on 18/01/17.
//  Copyright © 2017 Tanmoy. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    func scrollContentForViewFrame(activeFrame: CGRect, andParentView parentView: UIView) {
        weak var showObserver: AnyObject?
        weak var hideObserver: AnyObject?
        showObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: OperationQueue.main, using: {(note: Notification) -> Void in

            let kbSize = (note.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect).size
            let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
            self.contentInset = contentInsets
            self.scrollIndicatorInsets = contentInsets
            var aRect = parentView.frame
            aRect.size.height -= kbSize.height
            let aOrigin = CGPoint(x: activeFrame.origin.x, y: activeFrame.origin.y + activeFrame.size.height)
            
            if !aRect.contains(aOrigin) {
                self.scrollRectToVisible(activeFrame, animated: true)
            }
            else {
                self.scrollRectToVisible(CGRect.zero, animated: true)
            }
            NotificationCenter.default.removeObserver(showObserver as Any)
        })
        hideObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main, using: {(note: Notification)  in
            let contentInsets = UIEdgeInsets.zero
            self.contentInset = contentInsets
            self.scrollIndicatorInsets = contentInsets
            NotificationCenter.default.removeObserver(hideObserver as Any)
        })
    }}

