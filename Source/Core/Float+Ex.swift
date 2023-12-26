//
//  Float+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension Float {
    public var double: Double {
        Double(self)
    }
    
    public var cgFloat: CGFloat {
        CGFloat(self)
    }
    
    public var timeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var int: Int {
        Int(self)
    }
}
