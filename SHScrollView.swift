//
//  SHScrollView.swift
//  GatooDelivery
//
//  Created by user on 9/20/17.
//  Copyright © 2017 SubhajitHalder. All rights reserved.
//

import UIKit

class SHScrollView: UIScrollView, UIGestureRecognizerDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.panGestureRecognizer.delegate = self
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.next?.touchesBegan(touches, with: event)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !self.isDragging {
            
            self.next?.touchesMoved(touches, with: event)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.next?.touchesEnded(touches, with: event)
        
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
        
    }
    
}
