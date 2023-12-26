//
//  Int+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

//MARK: - property
extension Int {
    public var double: Double {
        Double(self)
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

//MARK: - operator
extension Int {
    public static func * (left: Int, right: CGFloat) -> CGFloat {
        return right * CGFloat(left)
    }
}
