//
//  CcToolKit.swift
//  CcToolKit
//
//  Created by yehao on 2023/8/16.
//

import Cocoa

public struct ExtensionWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol ExtensionCompatible {}

extension ExtensionCompatible {
    public var ex: ExtensionWrapper<Self> {
        get { return ExtensionWrapper(self) }
        set {}
    }
}

extension String: ExtensionCompatible {}
