//
//  NSRect+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/9/2.
//

import Cocoa

extension NSRect {
    public var left: CGFloat {
        get {
            return self.origin.x
        }
        set {
            var origin = self.origin
            origin.x = newValue
            self.origin = origin
        }
    }
    
    public var right: CGFloat {
        get {
            return self.origin.x + self.size.width
        }
        set {
            var size = self.size
            size.width = newValue - self.left
            self.size = size
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.origin.y
        }
        set {
            var origin = self.origin
            origin.y = newValue
            self.origin = origin
        }
    }
    
    public var top: CGFloat {
        get {
            return self.origin.y + self.size.height
        }
        set {
            var size = self.size
            size.height = newValue - self.bottom
            self.size = size
        }
    }
}
