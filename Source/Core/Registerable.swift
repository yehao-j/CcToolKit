//
//  Registerable.swift
//  Translate
//
//  Created by yehao on 2023/5/31.
//

import Cocoa

extension NSView {
    public static var name: String {
        return getClassName()
    }
    
    public var interfaceIdentifier: String? {
        get {
            return identifier?.rawValue
        }
        set {
            identifier = newValue.isNil ? nil : NSUserInterfaceItemIdentifier(newValue!)
        }
    }
    
    fileprivate static func getClassName() -> String {
        let identifier = String(describing: self)
        if identifier.contains(".") {
            return identifier.components(separatedBy: ".").last!
        } else {
            return identifier
        }
    }
}

extension NSTableColumn {
    public var interfaceIdentifier: String {
        get {
            return identifier.rawValue
        }
        set {
            identifier = NSUserInterfaceItemIdentifier(newValue)
        }
    }
}

extension NSTableView {
    public func dequeue<T: NSView>(identifier: String, owner: Any?) -> T {
        var cell = self.makeView(withIdentifier: NSUserInterfaceItemIdentifier(identifier), owner: owner) as? T
        if cell.isNil {
            cell = T()
            cell?.interfaceIdentifier = T.name
        }
        return cell!
    }
}
