//
//  NSTableColumn+Ex.swift
//  CcToolKit
//
//  Created by niko on 2024/1/3.
//

import Cocoa

extension NSTableColumn {
    public convenience init(id: String) {
        self.init(identifier: NSUserInterfaceItemIdentifier(id))
    }
}
