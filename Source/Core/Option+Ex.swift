//
//  Option+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension Optional {
    public var isNil: Bool {
        return self == nil
    }
    
    public var notNil: Bool {
        return self != nil
    }
}

extension Optional where Wrapped == String {
    public var unwrap: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == CGFloat {
    public var unwrap: CGFloat {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Double {
    public var unwrap: Double {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Int {
    public var unwrap: Int {
        return self ?? 0
    }
}

extension Optional where Wrapped == Float {
    public var unwrap: Float {
        return self ?? 0.0
    }
}
