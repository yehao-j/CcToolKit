//
//  NSColor+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

//MARK: - init
extension NSColor {
    public convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: alpha)
    }
    
    public convenience init(hexStr: String, alpha: CGFloat = 1.0) {
        var cString: String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        var hex: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&hex)

        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: alpha)
    }
    
    public static func hexStr(_ hexStr: String) -> NSColor {
        return NSColor(hexStr: hexStr)
    }
    
    public static func hex(_ hex: UInt) -> NSColor {
        return NSColor(hex: hex)
    }
}

