//
//  Dictionary+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension Dictionary {
    public var keys: [Key] {
        var keys = [Key]()
        self.forEach { item in
            keys.append(item.key)
        }
        return keys
    }
    
    public var values: [Value] {
        var values = [Value]()
        self.forEach { item in
            values.append(item.value)
        }
        return values
    }
    
    public func `safe`(key: Key) -> Value? {
        return self[key]
    }
}

extension Dictionary where Value: Hashable {
    public var keyValueReverse: [Value: Key] {
        var dict = [Value: Key]()
        self.forEach { item in
            dict[item.value] = item.key
        }
        return dict
    }
}
