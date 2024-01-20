//
//  CcTranslateController.swift
//  Translate
//
//  Created by niko on 2023/12/28.
//

import Cocoa

open class CcViewController: NSViewController {
    
    public var window: NSWindow! { view.window }
    
    open var viewSize: CGSize {
        return CGSize.zero
    }
    
    open override func loadView() {
        view = NSView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setFrameSize(viewSize)
        
        /// 解决Preferences库中作为subController的时候，不显示的问题
        view.widthAnchor.constraint(equalToConstant: viewSize.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: viewSize.height).isActive = true
    }
}
