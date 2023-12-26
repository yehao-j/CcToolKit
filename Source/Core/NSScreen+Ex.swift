//
//  NSScreen+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/9/1.
//

import Cocoa

extension NSScreen {
    public var top: CGFloat {
        return self.bottom + self.height
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.left + self.width
    }
    
    public var bottom: CGFloat {
        return self.frame.origin.y
    }
    
    public var width: CGFloat {
        return frame.size.width
    }
    
    public var height: CGFloat {
        return frame.size.height
    }
}
