//
//  NSControl+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/8/16.
//

import Cocoa

extension NSControl.StateValue {
    public var reverse: NSControl.StateValue {
        return self == .on ? .off : .on
    }
}
