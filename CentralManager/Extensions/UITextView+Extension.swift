//
//  UiTextField+Extension.swift
//  CentralManager
//
//  Created by Mr Uy Nguyen Long Uy on 6/2/18.
//  Copyright © 2018 Uy Nguyen Long. All rights reserved.
//

import Foundation
extension UITextView {
    func scrollToBotom() {
        self.scrollToRange(range: NSMakeRange(text.count - 1, 1))
    }
    
    func scrollToTop() {
        self.scrollToRange(range: NSMakeRange(0, 0))
    }
    
    func scrollToRange(range: NSRange) {
        ThreadManager.sharedInstance.dispatchToMainQueue {
            self.scrollRangeToVisible(range)
        }
    }
    
    func scrollToOffset(y: CGFloat) {
        ThreadManager.sharedInstance.dispatchToMainQueue {
            var rect = self.bounds
            rect = self.convert(rect, to: self)
            rect.origin.x = 0
            rect.origin.y -= y
            rect.size.height = self.frame.height
            self.scrollRectToVisible(rect, animated: true)
        }
    }
}
