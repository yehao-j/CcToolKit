//
//  CcTranslateController.swift
//  Translate
//
//  Created by niko on 2023/12/27.
//

import Cocoa

/// 可以通过window.styleMask = (closable | miniaturizable | resizable) 主要处理是否能够关闭，是否允许最小化，是否允许缩放
open class CcWindowController: NSWindowController {
    public var frame: NSRect {
        get {
            return window?.frame ?? CGRect.zero
        }
        set {
            window?.setFrame(newValue, display: false)
            window?.contentViewController?.view.setFrameSize(newValue.size)
        }
    }
    
    public convenience init(controller: CcViewController) {
        self.init()
        window?.contentViewController = controller
    }
    
    /// 需要对contentViewController属性进行赋值
    public convenience init() {
        /// window的窗口大小会自动去适配contentViewController中view的大小，如果设置
        let window = NSWindow(contentRect: CGRect.zero, styleMask: [.closable, .titled, .miniaturizable, .resizable], backing: .buffered, defer: false)
        self.init(window: window)
    }
    
    private override init(window: NSWindow?) {
        super.init(window: window)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show() {
        showWindow(self)
        if #available(macOS 14.0, *) {
            NSApp.activate()
        } else {
            NSApp.activate(ignoringOtherApps: true)
        }
    }
}
