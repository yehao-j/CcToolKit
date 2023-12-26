//
//  Operator+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

//MARK: - operator
extension CGFloat {
    public var double: Double {
        Double(self)
    }
    
    public var float: Float {
        Float(self)
    }
    
    public var timeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var int: Int {
        Int(self)
    }
    
    public static func * (left: CGFloat, right: Int) -> CGFloat {
        return left * CGFloat(right)
    }
}
