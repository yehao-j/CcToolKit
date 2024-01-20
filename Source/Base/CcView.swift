//
//  BaseView.swift
//  Translate
//
//  Created by niko on 2023/12/20.
//

import Cocoa

open class CcView: NSView {
    private var needFlipped: Bool = false
    
    public init(frame frameRect: NSRect = NSRect(), isFlipped: Bool = false) {
        super.init(frame: frameRect)
        self.needFlipped = isFlipped
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }
    
    /// 是否翻转坐标系，true:左上角为原点 false:左下角为原点
    open override var isFlipped: Bool {
        return needFlipped
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
