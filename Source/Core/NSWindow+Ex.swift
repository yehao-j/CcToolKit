//
//  NSWindow+Ex.swift
//  CcToolKit
//
//  Created by yehao on 2023/7/11.
//

import Cocoa

extension NSWindow {
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.setFrame(frame, display: true)
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.setFrame(frame, display: true)
        }
    }
    
    public var right: CGFloat {
        get {
            return self.left + self.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue - self.left
            self.setFrame(frame, display: false)
        }
    }
    
    public var top: CGFloat {
        get {
            return self.bottom + self.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue - self.bottom
            self.setFrame(frame, display: false)
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.setFrame(frame, display: true)
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.setFrame(frame, display: true)
        }
    }
    
    public var origin: NSPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.setFrame(frame, display: true)
        }
    }
    
    public var size: NSSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.setFrame(frame, display: true)
        }
    }
}

//MARK: - animation
extension NSWindow {
    public func animation(frame: NSRect, duration: TimeInterval = 0.3, complete: (() -> Void)? = nil) {
        NSAnimationContext.runAnimationGroup { context in
            context.duration = duration
            self.animator().setFrame(frame, display: true)
        } completionHandler: {
            complete?()
        }
    }
}

//MARK: - window等级
extension NSWindow.Level {
    private static func level(for cgLevelKey: CGWindowLevelKey) -> Self {
        .init(rawValue: Int(CGWindowLevelForKey(cgLevelKey)))
    }

    public static let desktop = level(for: .desktopWindow)
    public static let desktopIcon = level(for: .desktopIconWindow)
    public static let backstopMenu = level(for: .backstopMenu)
    public static let dragging = level(for: .draggingWindow)
    public static let overlay = level(for: .overlayWindow)
    public static let help = level(for: .helpWindow)
    public static let utility = level(for: .utilityWindow)
    public static let assistiveTechHigh = level(for: .assistiveTechHighWindow)
    public static let cursor = level(for: .cursorWindow)
    public static let minimum = level(for: .minimumWindow)
    public static let maximum = level(for: .maximumWindow)
}
