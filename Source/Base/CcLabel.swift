//
//  BaseLabel.swift
//  Translate
//
//  Created by niko on 2023/12/20.
//

import Cocoa

open class CcLabel: NSTextField {
    public var text: String? {
        didSet {
            self.stringValue = text ?? ""
        }
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.isEditable = false
        self.wantsLayer = true
        self.backgroundColor = .clear
        self.isBezeled = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
