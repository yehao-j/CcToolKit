//
//  Double+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension Double {
    public var int: Int {
        Int(self)
    }
    
    public var cgFloat: CGFloat {
        CGFloat(self)
    }
    
    public var timeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var float: Float {
        Float(self)
    }
}
