//
//  View+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

//MARK: - property
extension NSView {
    @IBInspectable
    public var cornerRadius: CGFloat {
        get {
            return layer?.cornerRadius ?? 0
        }
        set {
            wantsLayer = true
            layer?.masksToBounds = true
            layer?.cornerRadius = newValue.magnitude
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get {
            return layer?.borderWidth ?? 0
        }
        set {
            wantsLayer = true
            layer?.borderWidth = newValue
        }
    }
    
    @IBInspectable
    public var borderColor: NSColor? {
        get {
            guard let color = layer?.borderColor else { return nil }
            return NSColor(cgColor: color)
        }
        set {
            wantsLayer = true
            layer?.borderColor = newValue?.cgColor
        }
    }
    
    public var backColor: NSColor? {
        get {
            if self is NSTextField {
                return (self as! NSTextField).backgroundColor
            }
            
            guard let color = self.layer?.backgroundColor else {
                return nil
            }
            return NSColor(cgColor: color)
        }
        set {
            if self is NSTextField {
                (self as! NSTextField).backgroundColor = newValue
                return
            }
            
            wantsLayer = true
            self.layer?.backgroundColor = newValue?.cgColor
        }
    }
    
    ///从左上角开始算
    public var top: CGFloat {
        get {
            return self.bottom + self.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue - self.bottom
            self.frame = frame
        }
    }
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var right: CGFloat {
        get {
            return self.left + self.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue - self.left
            self.frame = frame
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    public var origin: NSPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
}

//MARK: - animation
extension NSView {
    public func animation(hidden: Bool, duration: TimeInterval = 0.3, complete: (() -> Void)? = nil) {
        let alpha: CGFloat = hidden ? 0 : 1
        if self.alphaValue == alpha {
            return
        }
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = duration
            self.animator().alphaValue = alpha
        } completionHandler: {
            complete?()
        }
    }
    
    public func animation(frame: NSRect, duration: TimeInterval = 0.3, complete: (() -> Void)? = nil) {
        NSAnimationContext.runAnimationGroup { context in
            context.duration = duration
            self.animator().frame = frame
        } completionHandler: {
            complete?()
        }
    }
}
