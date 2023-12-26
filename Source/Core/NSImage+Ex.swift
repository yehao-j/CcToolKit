//
//  NSImage+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/12.
//

import Cocoa

extension NSImage {
    // 重绘图片大小
    public func resize(width: CGFloat, height: CGFloat) -> NSImage {
        let toSize = CGSizeMake(width, height)
        let image = NSImage(size: toSize)
        image.lockFocus()
        self.draw(in: NSRect(origin: CGPoint.zero, size: toSize), from: NSRect.zero, operation: .sourceOver, fraction: 1)
        image.unlockFocus()
        return image
    }
    
    // 设置图片渲染颜色
    public func tint(with tintColor: NSColor) -> NSImage {
        let image = self.copy() as! NSImage
        image.isTemplate = false
        image.lockFocus()
        tintColor.set()
        let imageRect = NSRect(origin: .zero, size: image.size)
        imageRect.fill(using: .sourceIn)
        image.unlockFocus()
        
        return image
    }
}
