//
//  Array+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < count else {
            return nil
        }
        return self[index]
    }
    
    public func `safe`(index: Int) -> Element? {
        return self[safe: index]
    }
    
    public var notEmpty: Bool {
        return self.count > 0
    }
    
    public var isEmpty: Bool {
        return self.count == 0
    }
}
